# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'yaml'

ANSIBLE_PATH = "provision"

Vagrant.configure(2) do |config|
  config.vm.box = "server4001/bento-puppet"
  config.vm.box_version = "0.1.0"
  config.vm.provision :puppet do |puppet|
    puppet.options = "--verbose"
    puppet.module_path = "provision/modules"
    puppet.manifests_path = "provision/manifests"
    puppet.manifest_file = "provision.pp"
  end
end

