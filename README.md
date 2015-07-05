[![Build Status](https://travis-ci.org/orlissenberg/ansible-kibana.svg)](https://travis-ci.org/orlissenberg/ansible-kibana)

Ansible Kibana Role
===================

Install Kibana

Requirements
------------

No requirements.

Role Variables
--------------

    kibana_version: 4.1.1
    kibana_checksum: True
    kibana_uninstall_previous: False
    kibana_pkg_dest: /usr/local
    kibana_dest: /usr/local/kibana
    kibana_user: root
    kibana_group: staff
    kibana_host: "0.0.0.0"
    kibana_port: 5601
    kibana_elasticsearch_url: http://localhost:9201

Dependencies
------------

Elasticsearch instance (url).

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: kibana }

License
-------

MIT

