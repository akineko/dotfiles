#!/bin/bash
set -Ceux

curl https://sh.rustup.rs -sSf | sh

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

