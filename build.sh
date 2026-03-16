#!/usr/bin/env bash

set -e

Usage() {
  echo "$0 <image_name> [platforms] [tag]"
  echo "Example:"
  echo "  $0 dfimage linux/amd64,linux/arm64 latest"
}

if [ $# -eq 0 ]; then
  Usage
  exit 1
fi

image="ghcr.io/machanirobotics-labs/$1"
platform="${2:-linux/arm/v7,linux/arm64/v8,linux/arm/v6,linux/amd64,linux/ppc64le,linux/s390x}"
tag="${3:-latest}"

echo "Building and pushing ${image}:${tag}"
docker buildx build \
  --platform "${platform}" \
  --tag "${image}:${tag}" \
  --push \
  .
