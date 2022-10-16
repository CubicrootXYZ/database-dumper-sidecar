FROM alpine:3.16

COPY run.sh ./run.sh

RUN apk add --no-cache mysql-client

ENTRYPOINT [ "bash" "run.sh" ]