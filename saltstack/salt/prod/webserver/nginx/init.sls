nginx:
  pkg:
    - installed
  service:
    - name: nginx
    - running

/etc/nginx/sites-available:
  file.directory:
    - user: root
    - group: root
    - mode: '0755'
    - require:
      - pkg: nginx

/etc/nginx/sites-enabled:
  file.directory:
    - user: root
    - group: root
    - mode: '0755'
    - require:
      - pkg: nginx

/etc/nginx/nginx.conf:
  file.managed:
    - source: salt://webserver/nginx/nginx.conf
    - user: root
    - group: root
    - mode: '0644'
    - pkg: nginx


