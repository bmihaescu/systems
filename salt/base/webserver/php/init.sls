# Install PHP 7

add_yum_repo:
  cmd.run:
    - name: 'rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm; rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm; yum update'

php70w:
  pkg.installed
php70w-fpm:
  pkg.installed
php70w-intl:
  pkg.installed



