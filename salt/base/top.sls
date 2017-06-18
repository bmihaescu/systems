base:
  '*':
    - system_tools

  'myapp*':
    - loadbalancer.haproxy

  'web*':
    - webserver.php
    - webserver.nginx
    - webserver.joomla

  'db*':
    - dbserver.postgresql

  'dbmaster*':
    - dbserver.master_config

  'dbslave*':
    - dbserver.slave_config

  'monitor*':
    - monitorserver.influxdb
    - monitorserver.grafana
