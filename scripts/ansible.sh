#!/bin/bash -eux

# Install Ansible dependencies.
apt -y update && apt-get -y upgrade
apt -y install python-setuptools python-dev libssl-dev libffi-dev
/usr/bin/easy_install-2.7 pip

# Install Ansible.
pip install --upgrade cffi
pip install ansible
