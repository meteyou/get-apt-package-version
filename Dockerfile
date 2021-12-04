ARG BASE_IMAGE=ubuntu:focal

FROM $BASE_IMAGE
COPY get-package-version.sh /get-package-version.sh
ENTRYPOINT ["/get-package-version.sh"]