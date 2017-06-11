/etc/nginx/sites-available/joomla:
  file.managed:
    - source: salt://webserver/nginx/joomla/vhost_joomla
    - user: root
    - group: root
    - mode: '0644'

/etc/nginx/sites-enabled/joomla:
  file.symlink:
    - name: /etc/nginx/sites-enabled/joomla
    - target: /etc/nginx/sites-available/joomla

