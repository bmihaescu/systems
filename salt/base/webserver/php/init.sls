# Install PHP 7

add_yum_repo:
  cmd.run:
    - name: 'echo yes | rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm; echo yes | rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm; yum update -y'

php70w:
  pkg.installed
php70w-fpm:
  pkg.installed
php70w-intl:
  pkg.installed



