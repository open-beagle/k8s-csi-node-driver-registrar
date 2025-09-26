#!/bin/bash

set -ex

# 启用 Go modules，并强制 go build 使用 vendor 目录
export GO111MODULE=on
export CGO_ENABLED=0

export BUILD_VERSION=${BUILD_VERSION:-v2.15.0}

LDFLAGS="-X main.version=${BUILD_VERSION}"
LDFLAGS="${LDFLAGS} -extldflags '-static'"

mkdir -p bin
git config --global --add safe.directory $PWD

export GOARCH=amd64
go build -a -mod=vendor -ldflags "${LDFLAGS}" -o ./bin/csi-node-driver-registrar-amd64 ./cmd/csi-node-driver-registrar

export GOARCH=arm64
go build -a -mod=vendor -ldflags "${LDFLAGS}" -o ./bin/csi-node-driver-registrar-arm64 ./cmd/csi-node-driver-registrar
