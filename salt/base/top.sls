base:
  '*':
    - system_tools

  'loadbalancer*':
    - loadbalancer.haproxy

  'web*':
    - webserver.php
    - webserver.nginx
    - webserver.nginx.joomla

  'db*':
    - dbserver.postgresql

  'db_master*':
    - dbserver.master_config

  'db_slave*':
    - dbserver.slave_config
