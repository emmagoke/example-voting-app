FROM node:18-slim

# Non-root user and group
RUN addgroup --system app && adduser --system --ingroup app app

# add curl for healthcheck
RUN apt-get update && \
    apt-get install -y --no-install-recommends curl tini && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /usr/local/app

# have nodemon available for local dev use (file watching)
RUN npm install -g nodemon

COPY package*.json ./

RUN npm ci && \
 npm cache clean --force && \
 mv /usr/local/app/node_modules /node_modules

COPY --chown=app:app . .

ENV PORT=80
EXPOSE 80

# Switching to the Non-Root User
USER app

ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["node", "server.js"]
