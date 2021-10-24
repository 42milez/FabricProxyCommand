#!/bin/bash
set -eu

docker scan -f ./docker/base.Dockerfile fpc-base:latest
