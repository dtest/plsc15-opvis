#!/bin/bash

echo "Setting up the instances..."
sleep 2
ansible-playbook -i "localhost," ansible/playbooks/ec2_setup.yml

echo "Sleeping for a minute..."
sleep 60

echo "Running scripts to configure instance..."
sleep 2
ansible-playbook -i ansible/ec2.py ansible/playbooks/configure_instance.yml -e "targets=tag_Role_MySQL" --ask-vault-pass