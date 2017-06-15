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

/etc/collectd.conf:
  file.managed:
    - source: salt://system_tools/collectd.conf
    - user: root
    - group: root
    - mode: '0644'
    - template: jinja
    - require:
      - pkg: collectd

start_collectd_service:
  cmd.run:
    - name: 'systemctl start collectd'
    - user: root

enable_collectd_service:
  cmd.run:
    - name: 'systemctl enable collectd'
    - user: root
