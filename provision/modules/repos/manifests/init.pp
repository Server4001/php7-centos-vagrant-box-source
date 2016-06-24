class repos {
    yumrepo { 'epel':
        ensure     => 'present',
        descr      => 'Extra Packages for Enterprise Linux 6 - $basearch',
        enabled    => 1,
        gpgcheck   => 0,
        mirrorlist => 'https://mirrors.fedoraproject.org/metalink?repo=epel-6&arch=$basearch',
    }

    yumrepo { 'webtatic':
        ensure     => 'present',
        descr      => 'Webtatic Repository EL6 - $basearch',
        enabled    => 1,
        gpgcheck   => 0,
        mirrorlist => 'https://mirror.webtatic.com/yum/el6/$basearch/mirrorlist',
    }
}
