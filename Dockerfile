FROM golang:1.9-alpine
MAINTAINER team-infra@coreos.com

RUN apk add --no-cache git curl
RUN curl https://glide.sh/get | sh

ADD . $GOPATH/src/github.com/bitly/oauth2_proxy
WORKDIR $GOPATH/src/github.com/bitly/oauth2_proxy

RUN glide install -v --skip-test
RUN go install github.com/bitly/oauth2_proxy

ENTRYPOINT ["oauth2_proxy"]
