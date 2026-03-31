#!/bin/sh
# Railway sets PORT=3000 by default, which agentgateway uses for the admin UI.
# We want the proxy to be exposed on PORT, not the admin UI.
# So we save PORT to PROXY_PORT, unset PORT, and ensure config.yaml uses PROXY_PORT.

PROXY_PORT=${PORT:-3000}
unset PORT

# Replace the proxy port in config.yaml with the Railway-assigned port
sed -i "s/port: 3000/port: $PROXY_PORT/g" /config.yaml

# Set admin UI to a different port
export ADMIN_ADDR="127.0.0.1:15000"

echo "Starting agentgateway with proxy on port $PROXY_PORT and admin on 15000"
exec /usr/local/bin/agentgateway -f /config.yaml
