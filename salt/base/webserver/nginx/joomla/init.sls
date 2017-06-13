/etc/nginx/sites-available/joomla:
  file.managed:
    - source: salt://webserver/nginx/joomla/vhost_joomla
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

# Set owner
chown -R nginx:nginx /var/www/myapp.example.com/:
  cmd.run

# Set mode
chmod -R 755 /var/www/myapp.example.com/:
  cmd.run

chown root:nginx /var/lib/php/session:
  cmd.run
