class memcached {
    package { "libevent-devel":
        ensure => "latest",
    }

    package { "memcached":
        ensure => "latest",
        require => Package["libevent-devel"],
    }

    package { "telnet":
        ensure => "latest",
    }

    service { "memcached":
        ensure  => "running",
        enable  => true,
        require => Package["memcached"],
    }

    file { "/etc/sysconfig/memcached":
        content => template("memcached/memcached.erb"),
        owner   => root,
        group   => root,
        mode    => 0644,
        notify  => Service["memcached"],
    }
}
