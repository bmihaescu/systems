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

  'dbmaster*':
    - dbserver.master_config

  'dbslave*':
    - dbserver.slave_config

  'monitor*':
    - monitorserver.grafana
    - monitorserver.influxdb
