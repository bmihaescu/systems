base:
  pkgrepo.managed:
    - humanname: InfluxDB Repository - CENTOS \$releasever
    - name: influxdata-repo
    - baseurl: https://repos.influxdata.com/centos/\$releasever/\$basearch/stable
    - enabled: 1
    - gpgcheck: 1
    - gpgkey: https://repos.influxdata.com/influxdb.key

influxdb:
  pkg.installed:
    - fromrepo: influxdata-repo

/etc/influxdb/influxdb.conf:
  file.managed:
    - source: salt://monitorserver/influxdb/influxdb.conf
    - user: root
    - group: root
    - mode: '0644'
    - template: jinja
    - require:
      - pkg: influxdb

start_influxdb_service:
  cmd.run:
    - name: 'systemctl start influxdb'
    - user: root

enable_influxdb_service:
  cmd.run:
    - name: 'systemctl enable influxdb'
    - user: root
