#!/bin/sh -l

cd get-apt-package-version
docker build --build-arg BASE_IMAGE=$1 -t apt-package-version .
shift
docker run --rm apt-package-version "$@"