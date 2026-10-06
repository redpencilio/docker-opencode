FROM mikefarah/yq:4 AS yq
FROM node:22-slim

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
      git curl ca-certificates openssh-client \
      python3 python-is-python3 \
      ripgrep fd-find jq tree less file unzip procps make \
      sqlite3 libxml2-utils shellcheck poppler-utils \
      raptor2-utils \
    && ln -s /usr/bin/fdfind /usr/local/bin/fd \
    && rm -rf /var/lib/apt/lists/*

COPY --from=yq /usr/bin/yq /usr/local/bin/yq

RUN npm install -g \
      opencode-ai@1.17.9 \
      typescript \
      typescript-language-server \
      pyright \
      prettier \
      @ast-grep/cli \
    && npm cache clean --force

ENV NODE_PATH=/usr/local/lib/node_modules

WORKDIR /workspace

CMD ["sleep", "infinity"]
