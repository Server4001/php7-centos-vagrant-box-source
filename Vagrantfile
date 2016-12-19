# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "bento/centos-6.7"
  config.vm.box_version = "2.2.7"

  config.vm.provision :ansible_local do |ansible|
    ansible.playbook = "playbook.yml"
    ansible.provisioning_path = "/vagrant/provision"
    ansible.install = true
    ansible.verbose = true
  end
end

