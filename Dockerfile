FROM bash:alpine3.15

COPY run.sh ./run.sh

RUN apk add --no-cache mysql-client

RUN chmod +x run.sh

ENTRYPOINT [ "./run.sh" ]