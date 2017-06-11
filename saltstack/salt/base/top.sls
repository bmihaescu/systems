prod:

  'loadbalancer*':
    - loadbalancer.haproxy
  
  'web*':
    - webserver.php
    - webserver.nginx
    - webserver.nginx.joomla
