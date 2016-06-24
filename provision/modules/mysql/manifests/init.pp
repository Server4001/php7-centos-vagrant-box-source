class mysql {
    yumrepo { 'mysql57-community-dmr':
        ensure   => 'present',
        baseurl  => 'http://repo.mysql.com/yum/mysql-5.7-community/el/6/$basearch/',
        descr    => 'MySQL 5.7 Community Server Development Milestone Release',
        enabled  => 1,
        gpgcheck => 0,
    }
    yumrepo { 'mysql-tools-community':
        ensure   => 'present',
        baseurl  => 'http://repo.mysql.com/yum/mysql-tools-community/el/6/$basearch/',
        descr    => 'MySQL Tools Community',
        enabled  => 1,
        gpgcheck => 0,
        require  => Yumrepo["mysql57-community-dmr"],
    }
    yumrepo { 'mysql-connectors-community':
        ensure   => 'present',
        baseurl  => 'http://repo.mysql.com/yum/mysql-connectors-community/el/6/$basearch/',
        descr    => 'MySQL Connectors Community',
        enabled  => 1,
        gpgcheck => 0,
        require  => Yumrepo["mysql-tools-community"],
    }
    package { "mysql-community-server-5.7.13":
        ensure  => "installed",
        require => Yumrepo["mysql-connectors-community"],
    }
    file { "/var/log/mysql":
        ensure => "directory",
        owner  => "mysql",
        group  => "mysql",
        mode   => 0755,
    }
    exec {"/usr/sbin/mysqld --initialize-insecure":
        creates => "/var/lib/mysql/mysql",
        cwd => "/var/lib/mysql",
    }
}
