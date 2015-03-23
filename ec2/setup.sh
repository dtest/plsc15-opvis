#!/bin/bash

ansible-playbook -i "localhost," ../ansible/playbooks/ec2_setup.yml

ansible-playbook -i ../ansible/ec2.py ../ansible/playbooks/configure_instance.yml -e "targets=tag_Role_MySQL" --ask-vault-pass