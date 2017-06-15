/var/lib/pgsql/data/postgresql.conf:
  file.managed:
    - source: salt://dbserver/slave_config/postgresql.conf
    - user: postgres
    - group: postgres
    - mode: '0644'
    - template: jinja
    - require:
      - pkg: postgresql-server

stop_sql_service:
  cmd.run:
    - name: 'systemctl stop postgresql'
    - user: root

backup_original_data:
  cmd.run:
    - name: 'mv data data_original'
    - user: postgres

copy_master_data:
  cmd.run:
    - name: 'export PGPASSWORD=Admin123; pg_basebackup -h dbmaster.example.com -D /var/lib/pgsql/data/ -U joomla_user -v -P -w'
    - user: postgres

/var/lib/pgsql/data/recovery.conf:
  file.managed:
    - source: salt://dbserver/slave_config/recovery.conf
    - user: postgres
    - group: postgres
    - mode: '0644'
    - template: jinja
    - require:
      - pkg: postgresql-server

# Add trigger script to the scripts directory

/opt/scripts:
  file.directory:
    - user: root
    - group: root
    - mode: '0755'
    - makedirs: True

/opt/scripts/trigger_recovery.bash:
  file.managed:
    - source: salt://dbserver/slave_config/trigger_recovery.bash
    - user: root
    - group: root
    - mode: '0755'
    - template: jinja
    - require:
      - file: /opt/scripts

# Add cron to check every 5 min if master is running as expected

trigger_recovery.bash:
  cron.present:
    - name: /opt/scripts/trigger_recovery.bash
    - user: root
    - minute: '*/5'
    - comment: "Test if db master is working as expected"
    - identifier: trigger_recovery
