#!/bin/bash -eux

# Install Ansible dependencies.
apt -y update && apt-get -y upgrade
apt -y install python-pip python-dev python-setuptools libssl-dev libffi-dev

# Install Ansible.
pip install --upgrade cffi
pip install ansible
