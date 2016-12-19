# php7-centos-vagrant-box-source

Source environment for my [PHP7 CentOS vagrant box](https://atlas.hashicorp.com/server4001/boxes/php7-centos). Provisioned using Ansible.

### Pre-reqs

* [Ansible](http://docs.ansible.com/ansible/index.html)

### Versions

* CentOS release 6.7 (Final)
* Nginx 1.10.2
* MySQL 5.7.13
* PHP 7.0.13
* Beanstalkd 1.10
* Memcached 1.4.4
* Redis 2.4.10
* Composer 1.2.4

### Additional PHP extensions

* [ast](https://github.com/nikic/php-ast)
* [xdebug](https://xdebug.org/)
* [Data Structures](http://docs.php.net/manual/en/book.ds.php)
* [memcache](http://php.net/manual/en/book.memcache.php)

### Instructions

* `vagrant up`
* Make any changes you need to the box. Be sure to reflect these changes in the provisioning scripts.
* Before packaging up the box, ssh in, and run the commands that are in the comments at the end of this readme.
* Package up the box with `vagrant package --output php7-centos-0.3.0.box`. Replace `0.3.0` with the version number.
* Destroy the vm with `vagrant destroy --force`.
* Add the new box to vagrant's local list with: `vagrant box add php7-centos-030 php7-centos-0.3.0.box`. Again, replace `030` and `0.3.0` with the version number.
* Delete the `.vagrant` folder with `rm -rf .vagrant`.
* Test out the box by going to a different folder, running `vagrant init php7-centos-030`, and changing the `Vagrantfile` to fit your needs. Next, run `vagrant up`, and ensure everything is working.
* Create a new version on Atlas.
* Add a new provider to the version. The type should be `virtualbox`. Upload the `.box` file output by the `vagrant package` command above.
* Add a new tag in git.

### Pre-packaging commands

* `sudo yum clean all`
* `sudo dd if=/dev/zero of=/bigemptyfile bs=1M`
* `sudo rm -rf /bigemptyfile`
* `sudo su`
* `history -c && exit`
* `cat /dev/null > ~/.bash_history && history -c && exit`

### TODO

* Change provisioner to `ansible-local`.
