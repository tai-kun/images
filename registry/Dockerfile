ARG VERSION=_

FROM registry:${VERSION} AS src
FROM gcr.io/distroless/static

COPY --from=src /bin/registry /bin/registry

WORKDIR /registry

COPY ./auth   /auth
COPY ./config /registry

# https://github.com/distribution/distribution/issues/4270
ENV OTEL_TRACES_EXPORTER=none

ENTRYPOINT ["registry", "serve"]
CMD ["notls.yml"]
