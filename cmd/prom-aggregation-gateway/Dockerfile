FROM alpine:3.10
COPY prom-aggregation-gateway /

# Run as non-root user for security
USER 1001
ENTRYPOINT ["/prom-aggregation-gateway"]
