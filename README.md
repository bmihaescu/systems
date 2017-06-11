Create a vagrant setup with Docker backend that will create a highly available web application using Joomla.

Tech Requirements:

- Vagrant
- Vagrant-hostmanager plugin
   run  `vagrant plugin install vagrant-hostmanager`
- Docker

How to validate the setup:

    vagrant up
    Using firefox: https://myapp.example.com - loads preconfigured Joomla
    Using firefox: https://monitor.example.com - loads Grafana with metrics from all hosts

