#!/bin/bash -eux

# Uninstall Ansible and related tools.
pip uninstall -y ansible
apt -y remove --purge python-pip python-dev python-setuptools libssl-dev libffi-dev

# Apt cleanup.
apt autoremove
apt update

# Delete unneeded files.
rm -f /home/vagrant/*.sh

# Zero out the rest of the free space using dd, then delete the written file.
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY

# Add `sync` so Packer doesn't quit too early, before the large file is deleted.
sync
