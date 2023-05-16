#!/usr/bin/env bash

set -eu
set -o pipefail

version_file=.aqua/aqua-$AQUA_VERSION
if [ -f "$version_file" ]; then
  exit 0
fi

tempdir=$(mktemp -d)
cd "$tempdir"
curl -sSfL -O https://raw.githubusercontent.com/aquaproj/aqua-installer/v2.1.1/aqua-installer
echo "c2af02bdd15da6794f9c98db40332c804224930212f553a805425441f8331665  aqua-installer" | sha256sum -c
chmod +x aqua-installer

if [ -n "${AQUA_VERSION:-}" ]; then
  ./aqua-installer -v "$AQUA_VERSION"
  cd -
  mkdir -p .aqua
  touch "$version_file"
else
  ./aqua-installer
  cd -
fi

rm -R "$tempdir"

aqua i -l
