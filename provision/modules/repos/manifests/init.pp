class repos {
    yumrepo { 'epel':
        ensure     => 'present',
        mirrorlist => 'https://mirrors.fedoraproject.org/metalink?repo=epel-6&arch=$basearch',
        descr      => 'Extra Packages for Enterprise Linux 6 - $basearch',
        enabled    => 1,
        gpgcheck   => 0,
    }

    yumrepo { 'webtatic':
        ensure     => 'present',
        mirrorlist => 'https://mirror.webtatic.com/yum/el6/$basearch/mirrorlist',
        descr      => 'Webtatic Repository EL6 - $basearch',
        enabled    => 1,
        gpgcheck   => 0,
    }

    yumrepo { 'nginx':
        ensure   => 'present',
        baseurl  => 'http://nginx.org/packages/centos/6/$basearch/',
        descr    => 'nginx repo',
        enabled  => 1,
        gpgcheck => 0,
    }

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
}
