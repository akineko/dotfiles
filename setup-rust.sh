#!/bin/bash
set -Ceux

if ! (type rustup &> /dev/null); then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

tools=(
  "clippy"
  "rls"
  "rust-analysis"
  "rust-src"
  "rustfmt"
)

for tool in "${tools[@]}"; do
  rustup component add "${tool}"
done

