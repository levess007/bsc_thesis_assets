FROM golang:1.8-alpine
ADD . /go/src/hello-app
RUN go install hello-app

FROM alpine:latest
COPY --from=0 /go/bin/hello-app .
COPY ./interfacesetup.sh /
RUN apk --no-cache add iptables tcpdump iproute2 net-tools
ENV PORT 80
CMD ["./hello-app"]
