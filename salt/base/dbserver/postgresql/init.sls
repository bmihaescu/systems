postgresql-server:
  pkg.installed

postgresql-contrib:
  pkg.installed

initialize_db:
  cmd.run:
    - name: 'postgresql-setup initdb'
    - user: root

start_sql_service:
  cmd.run:
    - name: 'systemctl start postgresql'
    - user: root
