#!/bin/bash
set -eu

docker scan -f ./docker/base.Dockerfile fpc-base:latest
docker scan -f ./docker/bastion.Dockerfile fpc-bastion:latest
