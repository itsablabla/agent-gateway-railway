FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y ca-certificates curl && rm -rf /var/lib/apt/lists/*

# Download the Agent Gateway binary from GitHub Releases (public)
RUN curl -fsSL https://github.com/agentgateway/agentgateway/releases/download/v1.0.1/agentgateway-linux-amd64 \
    -o /usr/local/bin/agentgateway && \
    chmod +x /usr/local/bin/agentgateway

# Copy default config and start script
COPY config.yaml /config.yaml
COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
