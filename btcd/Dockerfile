FROM golang:1.20.4-alpine as builder

RUN apk add --no-cache git gcc musl-dev

WORKDIR $GOPATH/src/github.com/btcsuite/btcd

ARG BTCD_VERSION=v0.23.4

RUN git clone https://github.com/btcsuite/btcd.git . \
    && git checkout $BTCD_VERSION \
    && go install -v . ./cmd/...

FROM alpine as final

EXPOSE 8333 8334

EXPOSE 18333 18334

EXPOSE 18555 18556

EXPOSE 28901 28902

COPY --from=builder /go/bin/addblock /bin/
COPY --from=builder /go/bin/btcctl /bin/
COPY --from=builder /go/bin/btcd /bin/
COPY --from=builder /go/bin/findcheckpoint /bin/
COPY --from=builder /go/bin/gencerts /bin/

COPY "start-btcd.sh" .

RUN apk add --no-cache \
    bash \
    ca-certificates \
&&  mkdir "/rpc" "/root/.btcd" "/root/.btcctl" \
&&  touch "/root/.btcd/btcd.conf" \
&&  chmod +x start-btcd.sh \
&& "/bin/gencerts" --host="*" --directory="/rpc" --force

VOLUME ["/rpc"]
