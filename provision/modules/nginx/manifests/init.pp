class nginx {
    yumrepo { 'nginx':
        ensure   => 'present',
        baseurl  => 'http://nginx.org/packages/centos/6/$basearch/',
        descr    => 'nginx repo',
        enabled  => '1',
        gpgcheck => '0',
    }

    package { "nginx":
        ensure  => "installed",
        require => Yumrepo["nginx"],
    }

    service { "nginx":
        ensure  => "running",
        enable  => true,
        require => Package["nginx"],
    }
}
