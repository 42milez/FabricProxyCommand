#!/bin/bash
set -eu

readonly SSH_KEY_BASTION=./ssh/bastion
readonly SSH_KEY_TARGET=./ssh/target

test -e "${SSH_KEY_BASTION}" && rm -rf "${SSH_KEY_BASTION}"
test -e "${SSH_KEY_TARGET}" && rm -rf "${SSH_KEY_TARGET}"

ssh-keygen -t ed25519 -N '' -C 'bastion@example.com' -f "${SSH_KEY_BASTION}"
ssh-keygen -t ed25519 -N '' -C 'target@example.com' -f "${SSH_KEY_TARGET}"

chmod 0400 "${SSH_KEY_BASTION}"
chmod 0400 "${SSH_KEY_TARGET}"
