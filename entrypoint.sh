#!/bin/sh -l

docker build --build-arg BASE_IMAGE=$1 -t apt-package-version /get-apt-package-version
shift
#docker run --rm apt-package-version "$@"
docker run -d --name apt-package-version apt-package-version "$@"
docker exec apt-package-version sh -c 'echo "version=$VERSION"' >> $GITHUB_OUTPUT
docker stop apt-package-version
docker rm apt-package-version
