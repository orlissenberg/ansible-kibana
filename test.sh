#!/usr/bin/env bash

CURRENT_DIR=${PWD}
TMP_DIR=/tmp/ansible-test
mkdir -p $TMP_DIR 2> /dev/null

# Create hosts inventory
cat << EOF > $TMP_DIR/hosts
[webservers]
localhost ansible_connection=local
EOF

# Create group_vars for the webservers
mkdir -p $TMP_DIR/group_vars 2> /dev/null
cat << EOF > $TMP_DIR/group_vars/webservers
kibana_host: "0.0.0.0"
kibana_port: 5601
kibana_elasticsearch_url: http://127.0.0.1:9200

kibana_install_xpack: false
kibana_install_certbot: true
EOF

# Create Ansible config
cat << EOF > $TMP_DIR/ansible.cfg
[defaults]
roles_path = $CURRENT_DIR/../
host_key_checking = False
EOF

# Create playbook.yml
cat << EOF > $TMP_DIR/playbook.yml
---

- hosts: webservers
  gather_facts: yes
  become: true

  roles:
    - ansible-kibana
EOF

export ANSIBLE_CONFIG=$TMP_DIR/ansible.cfg

# Syntax check
ansible-playbook $TMP_DIR/playbook.yml -i $TMP_DIR/hosts --syntax-check

# First run
ansible-playbook $TMP_DIR/playbook.yml -i $TMP_DIR/hosts

# Idempotence test
# ansible-playbook $TMP_DIR/playbook.yml -i $TMP_DIR/hosts | grep -q 'changed=1.*failed=0' \
# 	&& (echo 'Idempotence test: pass' && exit 0) \
# 	|| (echo 'Idempotence test: fail' && exit 1)

# Test if kibana will run as a service.
# "permission denied, open '/var/run/kibana.pid"
# sudo -u kibana /usr/share/kibana/bin/kibana
