epel-release:
  pkg.installed

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

/var/www/myapp.example.com:
  file.directory:
    - user: root
    - group: root
    - mode: '0755'
    - require:
      - pkg: nginx

/var/www/myapp.example.com/index.html:
  file.managed:
    - source: salt://webserver/nginx/testlb_index.html
    - user: root
    - group: root
    - mode: '0755'
    - template: jinja
    - pkg: nginx

/etc/nginx/nginx.conf:
  file.managed:
    - source: salt://webserver/nginx/nginx.conf.default
    - user: root
    - group: root
    - mode: '0644'
    - pkg: nginx


