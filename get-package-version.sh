#!/usr/bin/env bash

set -euo pipefail
PPA=
PACKAGE=

while getopts "p:" OPTION; do
  case $OPTION in
  p)
    PPA="$OPTARG"
    ;;
  esac
done

shift "$(($OPTIND -1))"
PACKAGE=$*

if [ -z "$PACKAGE" ]
then
  echo "Package name is required, exiting..."
  exit 1
fi

apt-get update

if [[ ! -z "$PPA" ]]
then
  apt-get install -y software-properties-common
  add-apt-repository "$PPA"
fi

VERSION=$(apt policy "$PACKAGE" | sed -n 's/\s*Candidate: //p')
echo "::set-output name=version::$VERSION"