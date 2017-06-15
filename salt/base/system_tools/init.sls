rsyslog:
  pkg.installed

start_rsyslog_service:
  cmd.run:
    - name: 'systemctl start rsyslog'
    - user: root

enable_rsyslog_service:
  cmd.run:
    - name: 'systemctl enable rsyslog'
    - user: root

wget:
  pkg.installed

unzip:
  pkg.installed

cronie:
  pkg.installed

start_crond_service:
  cmd.run:
    - name: 'systemctl start crond'
    - user: root

enable_crond_service:
  cmd.run:
    - name: 'systemctl enable crond'
    - user: root

epel-release:
  pkg.installed

sshpass:
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
