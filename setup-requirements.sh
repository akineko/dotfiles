#!/bin/bash
set -Ceux

# node.js
# https://github.com/nodejs/node/blob/main/BUILDING.md#unix-prerequisites
sudo apt-get install -y --no-install-recommends python3 g++ make python3-pip

# python
# https://github.com/pyenv/pyenv/wiki#suggested-build-environment
sudo apt-get install -y --no-install-recommends \
  build-essential \
  curl \
  git \
  libbz2-dev \
  libffi-dev \
  liblzma-dev \
  libncursesw5-dev \
  libreadline-dev \
  libsqlite3-dev \
  libssl-dev \
  libxml2-dev \
  libxmlsec1-dev \
  tk-dev \
  xz-utils \
  zlib1g-dev

# ruby
# https://github.com/rbenv/ruby-build/wiki#ubuntudebianmint
sudo apt-get install -y --no-install-recommends \
  autoconf \
  build-essential \
  libdb-dev \
  libffi-dev \
  libgdbm-dev \
  libgdbm6 \
  libgmp-dev \
  libncurses5-dev \
  libreadline6-dev \
  libssl-dev \
  libyaml-dev \
  patch \
  rustc \
  uuid-dev \
  zlib1g-dev

# php
# https://github.com/php-build/php-build/blob/master/install-dependencies.sh
sudo apt-get install -y --no-install-recommends \
  autoconf2.13 \
  autoconf2.64 \
  autoconf \
  bash \
  bison \
  build-essential \
  ca-certificates \
  curl \
  findutils \
  git \
  libbz2-dev \
  libcurl4-gnutls-dev \
  libicu-dev \
  libjpeg-dev \
  libmcrypt-dev \
  libonig-dev \
  libpng-dev \
  libreadline-dev \
  libsqlite3-dev \
  libssl-dev \
  libtidy-dev \
  libxml2-dev \
  libxslt1-dev \
  libzip-dev \
  pkg-config \
  re2c \
  zlib1g-dev

