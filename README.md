# Agent Gateway on Railway

This repository deploys [Agent Gateway](https://agentgateway.dev) v1.0.1 on Railway using a custom Dockerfile.

## Architecture

- **Port 3000** — Main proxy port (LLM, MCP, A2A traffic)
- **Port 15000** — Admin UI (accessible via `ADMIN_ADDR=0.0.0.0:15000`)

## Configuration

Edit `config.yaml` to configure your LLM backends, MCP servers, and routing rules.

## Deployment

Railway will automatically build and deploy this Dockerfile on every push to `main`.
# Agent Gateway Railway Deploy - Tue Mar 31 02:24:54 EDT 2026
