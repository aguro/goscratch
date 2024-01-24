# Using latest alpine golang version as build image
FROM golang:alpine as builder
RUN apk update && apk add --no-cache ca-certificates tzdata && update-ca-certificates

# Copy only timezone data and ssl certificates
FROM scratch
COPY --from=builder /usr/share/zoneinfo /usr/share/zoneinfo
COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
