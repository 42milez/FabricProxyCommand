#!/bin/bash
set -eu

readonly TARGET_HOST=$1
readonly TARGET_PORT=$2
readonly PROXY_HOST=$3

ssh -F ./ssh/config -W "${TARGET_HOST}:${TARGET_PORT}" "${PROXY_HOST}"
