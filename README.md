# nred

A Node-RED project with essential packages pre-configured for messaging, database connectivity, email, image processing, and dashboard functionality.

## Overview

This project provides a Node-RED instance with a curated set of community-contributed nodes and packages, making it easy to build IoT applications, automation workflows, and data processing pipelines.

## Features

### Installed Packages

- **Messaging & Communication**
  - `@meowwolf/node-red-contrib-amqp` - AMQP/RabbitMQ messaging support
  - `node-red-contrib-email-out` - Email sending capabilities
  - `node-red-contrib-nodemailer-adapter` - Advanced email functionality
  - `node-red-node-email` - Built-in email nodes

- **Database Connectivity**
  - `node-red-node-mongodb` - MongoDB database integration
  - `node-red-node-mysql` - MySQL database integration

- **Web & HTTP**
  - `node-red-contrib-http-request-proxy` - HTTP requests with proxy support
  - `socks-proxy-agent` - SOCKS proxy support

- **Image Processing**
  - `node-red-contrib-image-output` - Image output nodes
  - `node-red-contrib-image-tools` - Image manipulation tools

- **Dashboard & UI**
  - `node-red-dashboard` - Web-based dashboard UI
  - `node-red-node-ui-table` - Table widget for dashboard
  - `node-red-contrib-ui-time-scheduler` - Time-based scheduling UI

- **Utilities**
  - `node-red-contrib-crypto-js` - Cryptographic operations
  - `node-red-contrib-function-npm` - Enhanced function node with npm support
  - `ssh2` - SSH client functionality

## Prerequisites

- Node.js (if running locally)
- Docker (if using containerized deployment)
- MongoDB/MySQL (if using database features)
- RabbitMQ (if using AMQP features)

## Installation

### Using Docker (Recommended)

1. Build the Docker image:
```bash
docker build -t nred .
```

2. Run the container:
```bash
docker run -it -p 1880:1880 -v $(pwd)/data:/data nred
```

The Node-RED editor will be available at `http://localhost:1880`

### Local Installation

1. Install Node.js dependencies:
```bash
npm install
```

2. Start Node-RED:
```bash
node-red
```

Or if Node-RED is installed globally:
```bash
node-red --settings settings.js
```

## Configuration

### Settings

The project uses a custom `settings.js` file with the following configurations:

- **Port**: Configurable via `PORT` environment variable (default: 1880)
- **Flow File**: `flows.json` (pretty-printed)
- **Global Context**: Pre-configured with:
  - `nodemailer` - Email functionality
  - `ssh2.Client` - SSH client
  - `socks-proxy-agent` - SOCKS proxy support
- **Function Node**: External modules enabled
- **Diagnostics**: Enabled
- **Logging**: Info level

### Environment Variables

- `PORT` - Port number for Node-RED web server (default: 1880)

### Docker Configuration

The Dockerfile includes:
- Node-RED 4.0.9 base image
- Alpine Linux packages: mysql-client, mongodb-tools, rabbitmq-c, sshpass, openssh-client, curl
- All npm dependencies from `package.json`

## Usage

1. Access the Node-RED editor at `http://localhost:1880`
2. Create your flows using the available nodes
3. Deploy your flows using the Deploy button
4. Access the dashboard (if configured) at `http://localhost:1880/ui`

## Project Structure

```
nred/
├── Dockerfile          # Docker container configuration
├── LICENSE             # MIT License
├── package.json        # Node.js dependencies
├── package-lock.json   # Dependency lock file
├── settings.js         # Node-RED configuration
└── README.md          # This file
```

## Development

### Adding New Packages

1. Install the package:
```bash
npm install <package-name> --save
```

2. Rebuild the Docker image (if using Docker):
```bash
docker build -t nred .
```

### Customizing Settings

Edit `settings.js` to customize:
- Security settings (authentication, HTTPS)
- Server configuration
- Editor theme
- Node-specific settings

Refer to the [Node-RED Configuration Documentation](https://nodered.org/docs/user-guide/runtime/configuration) for details.

## License

MIT License - see [LICENSE](LICENSE) file for details.

Copyright (c) 2025 Abomb

## Resources

- [Node-RED Documentation](https://nodered.org/docs/)
- [Node-RED Flow Library](https://flows.nodered.org/)
- [Node-RED Forum](https://discourse.nodered.org/)
