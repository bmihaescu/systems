install_grafana:
  cmd.run:
    - name: 'yum install https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana-4.3.1-1.x86_64.rpm -y'
    - user: root

/etc/grafana/grafana.ini:
  file.managed:
    - source: salt://monitorserver/grafana/grafana.ini
    - user: root
    - group: root
    - mode: '0644'
    - template: jinja

/var/lib/grafana/dashboards:
  file.directory:
    - user: grafana
    - group: grafana
    - mode: '0755'
    - makedirs: True

/var/lib/grafana/dashboards/DevOps_Monitor.json:
  file.managed:
    - source: salt://monitorserver/grafana/DevOps_Monitor.json
    - user: grafana
    - group: grafana
    - mode: '0644'
    - template: jinja

/etc/grafana/cert.pem:
  file.managed:
    - source: salt://monitorserver/grafana/ssl/cert.pem
    - user: root
    - group: grafana
    - mode: '0644'
    - template: jinja

/etc/grafana/cert.key:
  file.managed:
    - source: salt://monitorserver/grafana/ssl/cert.key
    - user: root
    - group: grafana
    - mode: '0644'
    - template: jinja

setcap 'cap_net_bind_service=+ep' /usr/sbin/grafana-server:
  cmd.run:
    - user: root

start_service:
  cmd.run:
    - name: 'systemctl daemon-reload; systemctl start grafana-server'
    - user: root

enable_service:
  cmd.run:
    - name: 'systemctl enable grafana-server'
    - user: root

