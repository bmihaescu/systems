prod:

  'loadbalancer*':
    - loadbalancer.haproxy
  
  'web*':
    - system_tools
    - webserver.php
    - webserver.nginx
    - webserver.nginx.joomla
