#!/bin/bash
set -Ceu

sudo apt-get -y install git

sudo apt-get -y install software-properties-common
sudo apt-add-repository -y ppa:ansible/ansible
sudo apt-get update
sudo apt-get -y install ansible

git clone https://github.com/akineko/dotfiles.git ~/dotfiles
cd ~/dotfiles/provisioning
ansible-playbook -i hosts development.yml -K

