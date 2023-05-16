#!/usr/bin/env bash

set -eu
set -o pipefail

exec docker run --rm -ti -w /workspace -v "$PWD:/workspace" alpine:3.17.0 sh
