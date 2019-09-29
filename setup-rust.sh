#!/bin/bash
set -Ceux

if !(type rustup &> /dev/null); then
  curl https://sh.rustup.rs -sSf | sh
fi

tools=(
  "clippy"
  "rls"
  "rust-analysis"
  "rust-src"
  "rustfmt"
)

for tool in ${tools[@]}; do
  rustup component add $tool
done

