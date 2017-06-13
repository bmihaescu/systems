/etc/postgresql/9.5/main/postgresql.conf:
  file.managed:
    - source: salt://dbserver/master_config/postgresql.conf
    - user: postgres
    - group: postgres
    - mode: '0644'
    - template: jinja
    - require:
      - pkg: postgresql

/etc/postgresql/9.5/main/pg_hba.conf:
  file.managed:
    - source: salt://dbserver/master_config/pg_hba.conf
    - user: postgres
    - group: postgres
    - mode: '0644'
    - template: jinja
    - require:
      - pkg: postgresql

/var/WAL_Archive/:
  file.directory:
    - user: postgres
    - group: postgres
    - mode: '0775'
    - makedirs: True
    - require:
      - pkg: postgresql

create_db:
  cmd.run:
    - name: 'createdb -T template0 joomladb'
    - user: postgres

create_user:
  cmd.run:
    - name: 'createuser joomla_user -d'
    - user: postgres

alter_user:
  cmd.run:
    - name: psql -d joomladb -c "alter user joomla_user REPLICATION LOGIN ENCRYPTED PASSWORD Admin123;"
    - user: postgres

restart_sql_service:
  cmd.run:
    - name: 'service postgresql restart'
    - user: root