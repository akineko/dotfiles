#!/bin/bash
set -Ceu

sudo apt-get -y install git software-properties-common
brew install ansible

cd provisioning
ansible-playbook -i hosts development.yml -K

