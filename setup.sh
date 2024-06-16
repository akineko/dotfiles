#!/bin/bash
set -Ceu

source "setup-requirements.sh"
source "setup-docker.sh"
source "setup-gcloud.sh"
source "setup-rust.sh"
source "setup-rusttools.sh"

mise install
# aqua は go install でインストールしている
source "setup-gotools.sh"
aqua install
