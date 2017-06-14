install_grafana:
  cmd.run:
    - name: 'yum install https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana-4.3.1-1.x86_64.rpm'
    - user: root

start_service:
  cmd.run:
    - name: 'systemctl daemon-reload; systemctl start grafana-server'
    - user: root

enable_service:
  cmd.run:
    - name: 'systemctl enable grafana-server'
    - user: root

