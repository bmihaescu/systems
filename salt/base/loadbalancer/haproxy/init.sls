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

enable_service:
  cmd.run:
    - name: 'systemctl enable haproxy'
    - user: root

start_service:
  cmd.run:
    - name: 'systemctl start haproxy'
    - user: root

