#!/bin/sh
# Copy flow files if they exist
for file in flows.json flows_cred.json; do
    if [ -f "/build/$file" ]; then
        cp "/build/$file" "/data/$file"
        echo "Copied $file"
    else
        echo "Skipping $file (not found)"
    fi
done

