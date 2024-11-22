ARG VERSION=_

FROM ghcr.io/tai-kun/surreallog:latest AS logger
FROM python:${VERSION}-slim

WORKDIR /home/python

COPY --from=logger /surreallog /
COPY ./requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt
RUN rm requirements.txt

ENTRYPOINT ["/surreallog"]
CMD ["python", "main.py"]
