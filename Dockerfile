FROM golang:1.16.2-alpine3.13 AS subjack
RUN apk --no-cache add git
RUN go get github.com/haccer/subjack

FROM alpine:3.13.2
COPY --from=subjack /go/bin/subjack /bin/subjack
RUN mkdir -p /src/github.com/haccer/subjack \
 && wget https://raw.githubusercontent.com/harbitz/subjack/master/fingerprints.json -P /src/github.com/haccer/subjack
ENTRYPOINT ["subjack"]