# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'yaml'

ANSIBLE_PATH = "provision"

Vagrant.configure(2) do |config|
  config.vm.box = "bento/centos-6.7"
  config.vm.box_version = "2.2.7"
  config.vm.provision :ansible do |ansible|
    ansible.playbook = File.join(ANSIBLE_PATH, "playbook.yml")
    ansible.verbose = true
  end
end

