#!/bin/bash
set -Ceu

# Docker
source "setup-docker.sh"

# Google Cloud SDK
source "setup-gcloud.sh"

# Rust ツールチェイン（rustup は継続）
source "setup-rust.sh"

# Go ツール（nixpkgs に無いもののみ）
source "setup-gotools-minimal.sh"

# レガシーツール（git clone で管理）
source "setup-legacy.sh"
