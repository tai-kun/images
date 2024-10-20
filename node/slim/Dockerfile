ARG VERSION=_

FROM oven/bun:latest AS bun
FROM node:${VERSION}-slim

COPY --from=bun /usr/local/bin/bun  /usr/local/bin/bun
COPY --from=bun /usr/local/bin/bunx /usr/local/bin/bunx

WORKDIR /home/node

ENTRYPOINT ["node"]
