# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "generic/alpine38"
  config.vm.provider "virtualbox" do |provider|
      provider.cpus=1
      provider.memory=1024
  end
  
  config.vm.network "private_network", ip: "192.168.56.15"
  config.vm.network "forwarded_port", guest: 80, host: 8080
  #config.vm.network "forwarded_port", guest: 8000, host: 8081
  config.vm.synced_folder "./src", "/var/www/localhost/htdocs/myagenda"
  #config.vm.provision "shell", inline: <<-SHELL
  #  cd .
  #  git pull
  #SHELL
  config.vm.provision "shell", path: "./config/install.sh"
  config.vm.provision "file" do |file|
    file.source = "./config/httpd.conf"
    file.destination = "/home/vagrant/conf/httpd.conf"
  end
  config.vm.provision "file" do |file2|
    file2.source = "./config/dbSecure.sql"
    file2.destination = "/home/vagrant/conf/dbSecure.sql"
  end
  config.vm.provision "file" do |file3|
    file3.source = "./config/my.cnf"
    file3.destination = "/home/vagrant/conf/my.cnf"
  end
  config.vm.provision "file" do |file4|
    file4.source = "./config/myagenda.conf"
    file4.destination = "/home/vagrant/conf/myagenda.conf"
  end
  config.vm.provision "shell", path: "./config/updateConfig1.sh"
  config.vm.provision "shell", path: "./config/step0.sh"
  #config.vm.provision "shell", inline: <<-SHELL
  #  apt-get update
  #  apt-get install -y apache2
  #SHELL
end
