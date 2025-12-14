FROM nodered/node-red:4.0.9

USER root
RUN npm install -g npm@latest

# Install Alpine packages
RUN apk update && apk add --no-cache \
    mysql-client \
    mongodb-tools \
    rabbitmq-c \
    sshpass \
    openssh-client \
    curl

# Use /data to install packages and store flows
WORKDIR /data

COPY package.json package-lock.json settings.js ./

#RUN npm ci --omit=dev \
#RUN npm install --omit=dev \
#     node-red-node-mysql \
#     node-red-node-mongodb \
#     node-red-node-email \
#     @meowwolf/node-red-contrib-amqp \
#     node-red-node-ui-table \
#     node-red-dashboard
     
RUN npm install --omit=dev
#RUN npm audit fix --force

# Copy flow configuration files (only if they exist)
# Copy the helper script first
COPY copy-flows.sh /tmp/copy-flows.sh
RUN chmod +x /tmp/copy-flows.sh
# Copy flow files if they exist
# Note: Docker COPY requires source files to exist. To handle optional files:
# Option 1: Use the provided docker-build.sh script (recommended)
# Option 2: Create empty placeholder files: touch flows.json flows_cred.json
# The script will handle copying only existing files
COPY flows*.json* /build/
RUN /tmp/copy-flows.sh && rm -rf /build /tmp/copy-flows.sh

# ⚠️ Reset to default Node-RED app directory
WORKDIR /usr/src/node-red

USER node-red