# Workaround from https://github.community/t/feature-request-build-args-support-in-docker-container-actions/16846/6
FROM alpine:latest

COPY get-apt-package-version /get-apt-package-version
COPY entrypoint.sh /entrypoint.sh

RUN apk add --update --no-cache docker
ENTRYPOINT ["/entrypoint.sh"]