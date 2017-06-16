install_grafana:
  cmd.run:
    - name: 'yum install https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana-4.3.1-1.x86_64.rpm -y'
    - user: root

/etc/grafana/grafana.init:
  file.managed:
    - source: salt://monitorserver/grafana/grafana.init
    - user: root
    - group: root
    - mode: '0644'
    - template: jinja

/etc/grafana/cert.pem:
  file.managed:
    - source: salt://monitorserver/grafana/ssl/cert.pem
    - user: root
    - group: root
    - mode: '0644'
    - template: jinja

/etc/grafana/cert.key:
  file.managed:
    - source: salt://monitorserver/grafana/ssl/cert.key
    - user: root
    - group: root
    - mode: '0644'
    - template: jinja

config_any_port:
  cmd.run:
    - name: 'setcap 'cap_net_bind_service=+ep' /usr/sbin/grafana-server'
    - user: root

start_service:
  cmd.run:
    - name: 'systemctl daemon-reload; systemctl start grafana-server'
    - user: root

enable_service:
  cmd.run:
    - name: 'systemctl enable grafana-server'
    - user: root

