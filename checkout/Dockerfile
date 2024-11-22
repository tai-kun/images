FROM alpine:latest

RUN apk add --no-cache wget unzip && \
    wget https://dl.min.io/client/mc/release/linux-amd64/mc -O /usr/local/bin/mc && \
    chmod +x /usr/local/bin/mc && \
    apk del wget

COPY ./checkout.sh /usr/local/bin/checkout.sh

RUN chmod +x /usr/local/bin/checkout.sh

ENV MINIO_ENDPOINT=""
ENV MINIO_USER=""
ENV MINIO_PASS=""
ENV OBJECT_KEY=""
ENV DEST_DIR=""

ENTRYPOINT ["/usr/local/bin/checkout.sh"]
