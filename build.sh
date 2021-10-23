#!/bin/bash
set -eu

docker build --no-cache -t fpc-base:latest -f ./docker/base.Dockerfile .
docker-compose build --no-cache
