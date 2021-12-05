#!/bin/sh -l

docker build --build-arg BASE_IMAGE=$1 -t apt-package-version /get-apt-package-version
shift
docker run --rm apt-package-version "$@"