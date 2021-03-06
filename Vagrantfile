# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'yaml'

if File.exist?('vagrant_settings.yaml')
  settings = YAML.load_file 'vagrant_settings.yaml'
else
  exit 1
end

Vagrant.configure("2") do |config|
  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.hostmanager.manage_guest = true
  config.hostmanager.include_offline = true

  if settings['vm_provider'] == 'docker'
    config.ssh.username = "root"
  end
	
  settings['hosts'].each do |my_host|
    config.vm.define my_host do |saltbox|
      config.vm.boot_timeout = 6000
      saltbox.vm.provider "docker" do |d|
        d.build_dir = "build/"
	d.has_ssh = true
	d.create_args = ["--privileged", "-dt"]
	d.env = { "container" => "docker" }
	d.volumes = ["/sys/fs/cgroup:/sys/fs/cgroup:ro"]
      end
      
      saltbox.vm.hostname = "#{my_host}.example.com"
      saltbox.ssh.insert_key = false
      
      $is_salt_master = (my_host == 'saltmaster') ? true : false
      $is_lb_minion = (my_host == 'myapp') ? true : false
      $is_web01_minion = (my_host == 'web01') ? true : false
      $is_web02_minion = (my_host == 'web02') ? true : false
      $is_dbmaster_minion = (my_host == 'dbmaster') ? true : false
      $is_dbslave_minion = (my_host == 'dbslave') ? true : false
      $is_monitor_minion = (my_host == 'monitor') ? true : false

      if ($is_salt_master == true)
        saltbox.vm.synced_folder ".", "/vagrant", create: true
        saltbox.vm.synced_folder "#{settings['salt']['salt_path']}", "/srv/salt", create: true
        saltbox.vm.synced_folder "#{settings['salt']['pillar_path']}", "/srv/pillar", create: true
      end

      if settings['vm_provider'] == 'docker'
	saltbox.hostmanager.ip_resolver = proc do |machine|
	  result = ""
	  machine.communicate.execute("/sbin/ifconfig eth0") do |type, data|
	    result << data if type == :stdout
	  end
	  (ip = /^\s*inet .*?(\d+\.\d+\.\d+\.\d+)\s+/.match(result)) && ip[1]
	end
      end

      saltbox.vm.provision "salt" do |salt|
	salt.install_type = "stable 2016.11.5"
	salt.verbose = true
	salt.colorize = true
	salt.log_level = 'debug'
	salt.bootstrap_options = '-P -p python-gnupg -p gnupg2 -p tar'
	
	if ($is_salt_master == true)
	  salt.master_config = "build/saltstack/etc/master"
          salt.master_key = "build/saltstack/keys/master.pem"
	  salt.master_pub = "build/saltstack/keys/master.pub"
	  salt.seed_master = {
		             "myapp.example.com" => "build/saltstack/keys/myapp.example.com.pub",
		             "web01.example.com" => "build/saltstack/keys/web01.example.com.pub",
		             "web02.example.com" => "build/saltstack/keys/web02.example.com.pub",
			     "dbmaster.example.com" => "build/saltstack/keys/dbmaster.example.com.pub",
                             "dbslave.example.com" => "build/saltstack/keys/dbslave.example.com.pub",
			     "monitor.example.com" => "build/saltstack/keys/monitor.example.com.pub"
			     }		
	  salt.bootstrap_options += ' -M -S'
	  salt.install_master = true
	  salt.run_highstate = true
	end
        if ($is_lb_minion == true)
	  salt.minion_config = "build/saltstack/etc/myapp"
          salt.minion_key = "build/saltstack/keys/myapp.example.com.pem"
          salt.minion_pub = "build/saltstack/keys/myapp.example.com.pub"
	  salt.run_highstate = false
	end
	if ($is_web01_minion == true)
	  salt.minion_config = "build/saltstack/etc/web01"
          salt.minion_key = "build/saltstack/keys/web01.example.com.pem"
          salt.minion_pub = "build/saltstack/keys/web01.example.com.pub"
	  salt.run_highstate = false
	end
	if ($is_web02_minion == true)
	  salt.minion_config = "build/saltstack/etc/web02"
          salt.minion_key = "build/saltstack/keys/web02.example.com.pem"
          salt.minion_pub = "build/saltstack/keys/web02.example.com.pub"
	  salt.run_highstate = false
	end
	if ($is_dbmaster_minion == true)
	  salt.minion_config = "build/saltstack/etc/dbmaster"
          salt.minion_key = "build/saltstack/keys/dbmaster.example.com.pem"
          salt.minion_pub = "build/saltstack/keys/dbmaster.example.com.pub"
	  salt.run_highstate = false
	end
	if ($is_dbslave_minion == true)
	  salt.minion_config = "build/saltstack/etc/dbslave"
          salt.minion_key = "build/saltstack/keys/dbslave.example.com.pem"
          salt.minion_pub = "build/saltstack/keys/dbslave.example.com.pub"
	  salt.run_highstate = false
	end
	if ($is_monitor_minion == true)
	  salt.minion_config = "build/saltstack/etc/monitor"
          salt.minion_key = "build/saltstack/keys/monitor.example.com.pem"
          salt.minion_pub = "build/saltstack/keys/monitor.example.com.pub"
	  salt.run_highstate = false
	end
      end   
    end
  end
end
