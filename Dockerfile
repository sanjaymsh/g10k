FROM golang:1.13 as builder
WORKDIR /go/src/github.com/xorpaul/g10k
COPY . .
RUN make g10k

FROM puppet/r10k:3.1.0
COPY --from=builder /go/src/github.com/xorpaul/g10k/g10k /usr/local/bin/
ENTRYPOINT ["/usr/local/bin/g10k"]
RUN apt-get update && apt-get install -y git && apt-get clean
CMD [""]
