#!/bin/sh
set -eu

: "${PORT:=3000}"
export PORT

echo "Starting 3x-ui v3.7.0 with nginx on PORT=${PORT}"
cd /usr/local/x-ui

# Configure the panel's private web port and base path.
./x-ui setting -port 2053 -webBasePath /managepanel/ || true

# Render nginx configuration using Railway's PORT.
envsubst '${PORT}' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf

# Start the panel, then keep nginx in the foreground.
./x-ui &
X_UI_PID=$!

sleep 2
nginx -t
exec nginx -g 'daemon off;'
