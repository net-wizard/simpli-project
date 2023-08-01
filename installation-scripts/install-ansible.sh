#!/bin/bash
# Install Ansible on Ubuntu
sudo apt install software-properties-common -y
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible -y