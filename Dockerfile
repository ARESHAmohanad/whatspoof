FROM golang:latest

RUN apt update && apt install python3 python3-pip python3-venv -y
RUN python3 -m venv /venv
ENV PATH=/venv/bin:/go/bin:/usr/local/go/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV VIRTUAL_ENV=/venv

WORKDIR /app

COPY . .

RUN CGO_ENABLED=1 GOOS=linux GOARCH=amd64 go get
RUN CGO_ENABLED=1 GOOS=linux GOARCH=amd64 go build -v -a -o whats-spoofing

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/app/whats-spoofing"]

ENTRYPOINT [ "/entrypoint.sh" ]

