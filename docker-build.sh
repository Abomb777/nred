#!/bin/sh
# Build script to handle optional flow files for Docker build
# Usage: ./docker-build.sh [docker build options]

set -e

# Check if flow files exist
HAS_FLOWS=false
if [ -f flows.json ] || [ -f flows_cred.json ]; then
    HAS_FLOWS=true
    echo "Found flow files"
fi

# If no flow files exist, create empty placeholders temporarily
if [ "$HAS_FLOWS" = false ]; then
    echo "No flow files found, creating temporary placeholders for build"
    touch flows.json flows_cred.json
    TEMP_FILES=true
else
    TEMP_FILES=false
fi

# Build the Docker image
docker build -f Dockerfile -t nred "$@" .

# Clean up temporary files if we created them
if [ "$TEMP_FILES" = true ]; then
    rm -f flows.json flows_cred.json
    echo "Removed temporary placeholder files"
fi

