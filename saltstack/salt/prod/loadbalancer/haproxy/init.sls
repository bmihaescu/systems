haproxy:
  pkg.installed

/etc/haproxy/haproxy.cfg:
  file.managed:
    - source: salt://loadbalancer/haproxy/haproxy.cfg
    - user: root
    - group: root
    - mode: '0644'
    - template: jinja
    - require:
      - pkg: haproxy

/etc/ssl/example.com.pem:
  file.managed:
    - source: salt://loadbalancer/haproxy/example.com.pem
    - user: root
    - group: root
    - mode: '0644'
    - template: jinja

service:
    - name: haproxy
    - running

