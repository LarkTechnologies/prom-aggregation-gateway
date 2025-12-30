FROM golang:alpine as builder
ADD . /src/github.com/LarkTechnologies/prom-aggregation-gateway
WORKDIR /src/github.com/LarkTechnologies/prom-aggregation-gateway
RUN \
  CGO_ENABLED=0 GOOS=linux \
  go build -o /go/bin \
  -a -installsuffix cgo -ldflags '-extldflags "-static"' \
  ./cmd/...

FROM scratch
COPY --from=builder /go/bin /app/
EXPOSE 9091
WORKDIR /app

# Run as non-root user for security
USER 1001
CMD ["./prom-aggregation-gateway"]
