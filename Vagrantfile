# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.hostname = "vm"

  config.vm.define "linux", primary: false, autostart: false do |linux|
    linux.vm.box = "ubuntu"
    linux.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/vivid/current/vivid-server-cloudimg-amd64-vagrant-disk1.box"
    linux.vm.network "private_network", ip: "192.168.10.10"

    linux.ssh.insert_key = false

    linux.vm.provider "virtualbox" do |vb|
      vb.name = "env-linux"
      vb.cpus = 2
      vb.memory = 5 * 1024
      vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      vb.customize ["guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-set-threshold", 10000]
    end

    linux.vm.provision "ansible" do |ansible|
      ansible.playbook = "linux.yml"
    end
  end

  config.vm.define "osx", primary: true, autostart: true do |osx|
    osx.vm.box = "jhcook/osx-elcapitan-10.11"

    osx.vm.provider "virtualbox" do |vb|
      vb.name = "env-osx"
      vb.memory = 5 * 1024
      vb.customize ["modifyvm", :id, "--usb", "on"]
      vb.customize ["modifyvm", :id, "--usbehci", "off"]
    end

    osx.vm.provision "ansible" do |ansible|
      ansible.playbook = "osx.yml"
    end
  end
end
