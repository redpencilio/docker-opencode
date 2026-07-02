FROM node:22-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
      git curl ca-certificates python3 \
    && rm -rf /var/lib/apt/lists/*

RUN npm install -g \
      opencode-ai@1.17.9 \
      typescript \
      typescript-language-server \
      pyright

ENV NODE_PATH=/usr/local/lib/node_modules

WORKDIR /workspace

CMD ["sleep", "infinity"]
