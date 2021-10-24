#!/bin/bash
set -eu

readonly SSH_KEY_BASTION=./ssh/bastion
readonly SSH_KEY_TARGET_1=./ssh/target1
readonly SSH_KEY_TARGET_2=./ssh/target2

test -e "${SSH_KEY_BASTION}" && rm -rf "${SSH_KEY_BASTION}"
test -e "${SSH_KEY_TARGET_1}" && rm -rf "${SSH_KEY_TARGET_1}"
test -e "${SSH_KEY_TARGET_2}" && rm -rf "${SSH_KEY_TARGET_2}"

ssh-keygen -t ed25519 -N '' -C 'bastion@example.com' -f "${SSH_KEY_BASTION}"
ssh-keygen -t ed25519 -N '' -C 'target1@example.com' -f "${SSH_KEY_TARGET_1}"
ssh-keygen -t ed25519 -N '' -C 'target2@example.com' -f "${SSH_KEY_TARGET_2}"

chmod 0400 "${SSH_KEY_BASTION}"
chmod 0400 "${SSH_KEY_TARGET_1}"
chmod 0400 "${SSH_KEY_TARGET_2}"
