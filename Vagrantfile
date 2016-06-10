# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'yaml'

ANSIBLE_PATH = "provision"

Vagrant.configure(2) do |config|
  config.vm.box = "bento/centos-6.7"
  config.vm.box_version = "2.2.7"
  config.vm.provision :puppet do |puppet|
    puppet.module_path = "provision/modules"
    puppet.manifests_path = "provision/manifests"
    puppet.manifest_file = "provision.pp"
  end
end

