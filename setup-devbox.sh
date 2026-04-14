#!/bin/bash
set -Ceu

if ! (type devbox &>/dev/null); then
  curl -fsSL https://get.jetify.com/devbox | bash
fi
