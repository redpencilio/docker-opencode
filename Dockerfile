FROM node:22-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
      git curl ca-certificates python3 \
    && rm -rf /var/lib/apt/lists/*

# Docker CLI + compose plugin — CLIENT ONLY.
RUN install -m 0755 -d /etc/apt/keyrings \
    && curl -fsSL https://download.docker.com/linux/debian/gpg \
         -o /etc/apt/keyrings/docker.asc \
    && chmod a+r /etc/apt/keyrings/docker.asc \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian $(. /etc/os-release && echo "$VERSION_CODENAME") stable" \
         > /etc/apt/sources.list.d/docker.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
         docker-ce-cli \
         docker-compose-plugin \
    && rm -rf /var/lib/apt/lists/*

RUN npm install -g \
      opencode-ai@1.17.9 \
      typescript \
      typescript-language-server \
      pyright

ENV NODE_PATH=/usr/local/lib/node_modules

WORKDIR /workspace

CMD ["sleep", "infinity"]