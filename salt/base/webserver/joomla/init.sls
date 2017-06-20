/etc/nginx/sites-available/joomla:
  file.managed:
    - source: salt://webserver/joomla/vhost_joomla
    - user: root
    - group: root
    - mode: '0644'

/etc/nginx/sites-enabled/joomla:
  file.symlink:
    - name: /etc/nginx/sites-enabled/joomla
    - target: /etc/nginx/sites-available/joomla

# Get latest joomla
wget https://downloads.joomla.org/cms/joomla3/3-7-2/Joomla_3-7.2-Stable-Full_Package.zip -P /tmp:
  cmd.run:
    - unless: 'ls /var/www/myapp.example.com/index.php'

# Unzip it
unzip -q /tmp/Joomla_3-7.2-Stable-Full_Package.zip -d /var/www/myapp.example.com:
  cmd.run:
    - unless: 'ls /var/www/myapp.example.com/index.php'

/var/www/myapp.example.com/configuration.php:
  file.managed:
    - source: salt://webserver/joomla/configuration.php
    - user: root
    - group: root
    - mode: '0644'

# Remove installation folder
/var/www/myapp.example.com/installation:
  file.absent

chown_wwww:
  cmd.run:
    - name: 'sudo chown -R apache:apache /var/www'

restart_service:
  cmd.run:
    - name: 'systemctl restart nginx'
    - user: root
