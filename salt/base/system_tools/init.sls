wget:
  pkg.installed

unzip:
  pkg.installed

epel-release:
  pkg.installed

collectd:
  pkg.installed

start_collectd_service:
  cmd.run:
    - name: 'systemctl start collectd'
    - user: root

enable_collectd_service:
  cmd.run:
    - name: 'systemctl enable collectd'
    - user: root
