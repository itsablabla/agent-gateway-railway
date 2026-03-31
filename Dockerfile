FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y ca-certificates curl && rm -rf /var/lib/apt/lists/*

# Download the Agent Gateway binary from GitHub Releases (public)
RUN curl -fsSL https://github.com/agentgateway/agentgateway/releases/download/v1.0.1/agentgateway-linux-amd64 \
    -o /usr/local/bin/agentgateway && \
    chmod +x /usr/local/bin/agentgateway

# Copy default config
COPY config.yaml /config.yaml

EXPOSE 3000 15000

ENV ADMIN_ADDR=0.0.0.0:15000

CMD ["/usr/local/bin/agentgateway", "-f", "/config.yaml"]
