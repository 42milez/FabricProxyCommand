#!/bin/bash
set -eu

docker scan -f ./docker/base.Dockerfile fpc-base:latest
docker scan -f ./docker/host.Dockerfile fpc-bastion:latest
docker scan -f ./docker/host.Dockerfile fpc-target:latest
