# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |test|
 test.vm.box_check_update = "false"
 test.vm.provider "virtualbox" do |vb|
   vb.memory = "1024"
 end
 
 test.vm.define "webserver1" do |web1|
   web1.vm.hostname = "web01"
   web1.vm.box = "geerlingguy/centos7"
   web1.vm.network :private_network, ip: "192.168.56.2", virtualbox__intnet: "VirtualBox Host-Only Ethernet Adapter"
   web1.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--memory", 512]
      v.customize ["modifyvm", :id, "--name", "web01"]
    end
   web1.vm.network "forwarded_port", guest: "80", host: "8080"
   
   #Provision the webserver with Ansible
   web1.vm.provision "ansible_local" do |ansible|
     ansible.playbook="apache-playbook.yaml"
	 ansible.install_mode="pip"
	 ansible.version="latest"
   end
 end
 test.vm.define "webserver2" do |web2|
   web2.vm.hostname = "web02"
   web2.vm.box = "geerlingguy/centos7"
   web2.vm.network :private_network, ip: "192.168.56.3", virtualbox__intnet: "VirtualBox Host-Only Ethernet Adapter"
   web2.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--memory", 512]
      v.customize ["modifyvm", :id, "--name", "web02"]
    end
   web2.vm.network "forwarded_port", guest: "80", host: "8082"
   
   #Provision the webserver with Ansible
   web2.vm.provision "ansible_local" do |ansible|
     ansible.playbook="apache-playbook.yaml"
	 ansible.install_mode="pip"
	 ansible.version="latest"
   end
 end 
 test.vm.define "nginx" do |nginx|
   nginx.vm.hostname = "nginx"
   nginx.vm.box = "geerlingguy/centos7"
   nginx.vm.network :private_network, ip: "192.168.56.4", virtualbox__intnet: "VirtualBox Host-Only Ethernet Adapter"
   nginx.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--memory", 512]
      v.customize ["modifyvm", :id, "--name", "nginx"] 
    end
   nginx.vm.network "forwarded_port", guest: "8080", host: "8083"
   #Provision the server with nginx
   nginx.vm.provision "shell", inline: <<-SHELL
     sudo yum install -y yum-utils
	 sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
	 sudo yum install -y docker-ce docker-ce-cli containerd.io docker-compose docker-compose-cli
	 sudo systemctl start docker
	 cd /vagrant
	 sudo docker-compose up -d
   SHELL
   end
 end 
