Create a vagrant setup with Docker backend that will create a highly available web application using Joomla.

Description:

- All hosts run Centos 7
- All passwords are Admin1234
- All the configuration is centralized by Saltstack with roles
- The Joomla webapp run as https://myapp.example.com
- Loadbalancer has a self-signed SSL certificate
- PostgreSQL databases work in a master-slave setup (hot_standby)
- Monitoring host uses CollectD and Influxdb to pick up metrics and display them using Grafana

Tech Requirements:

- Vagrant
- Vagrant-hostmanager plugin
   run  `vagrant plugin install vagrant-hostmanager`
- Docker

How to validate the setup:

    vagrant up (saltmaster should be last one)
    Using firefox: https://myapp.example.com - loads preconfigured Joomla
    Using firefox: https://monitor.example.com - loads Grafana with metrics from all hosts

