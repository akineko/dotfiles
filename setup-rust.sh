#!/bin/bash
set -Ceux

if ! (type rustup &> /dev/null); then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

tools=(
  "clippy"
  "rust-src"
  "rust-analyzer"
  "rustfmt"
)

for tool in "${tools[@]}"; do
  rustup component add "${tool}"
done

cargo install cargo-binstall
cargo binstall -y cargo-cache cargo-list

# ubuntu 22.04 で libssl.so.1.1 が見つからないエラーが出た時の対応
# wget http://nz2.archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2.22_amd64.deb
# sudo dpkg -i libssl1.1_1.1.1f-1ubuntu2.22_amd64.deb
