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

COPY package.json package-lock.json* ./

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

# Copy flow configuration files
# COPY flows.json flows_cred.json settings.js ./
COPY flows.json ./

# ⚠️ Reset to default Node-RED app directory
WORKDIR /usr/src/node-red

USER node-red