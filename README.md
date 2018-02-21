# ansible-role-monit [![Build Status](https://travis-ci.org/shengyou/ansible-role-monit.svg?branch=master)](https://travis-ci.org/shengyou/ansible-role-monit)
=========

安裝 monit。

適用於
* Ubuntu 14.04, 16.04
* CentOS 6, 7

Requirements
------------

* ansible >= 2.4
* python >= 2.6

Role Variables
--------------

以下 Variables 非必填項目，想要設定客製的 monit config 才需要設置。

使用方式請參考範例。

* custom_monitrc
* custom_monit_conf

如果想要 monit 送訊息至 slack，可以設置下述 Variable，即會自動複製名為 `notification_by_slack.sh` 的 shell script 至 host，可透過此 script 推送訊息。

* slack_hook_url


Dependencies
------------

none.

Example Playbook
----------------

```
- name: install_monit.yml
  hosts: your_host
  gather_facts: yes
  become: yes

  vars:
   - custom_monitrc: /path/to/your/custom_monitrc

   - custom_monit_conf::
       - src: /path/to/monit_configs
         filename: monit_config_filename
       - src: /path/to/monit_configs
         filename: monit_config_filename

   - slack_hook_url: "https://hook.slack.com/xxxxxxxxxx"

  roles:
    - ansible-role-monit
```

License
-------

MIT
