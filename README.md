[![Build Status](https://travis-ci.org/orlissenberg/ansible-kibana.svg)](https://travis-ci.org/orlissenberg/ansible-kibana)

Ansible Kibana Role
===================

Install Kibana

[https://www.elastic.co/start](https://www.elastic.co/start)

Requirements
------------

No requirements.

Role Variables
--------------

    kibana_user: kibana
    kibana_group: kibana

    kibana_host: "127.0.0.1"
    kibana_port: 5601
    kibana_elasticsearch_url: http://127.0.0.1:9200

    kibana_install_xpack: false
    kibana_install_certbot: false

Dependencies
------------

--

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: kibana }

License
-------

MIT

