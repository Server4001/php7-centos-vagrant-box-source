class redis {
    package { "redis":
        ensure  => "installed",
        require => Yumrepo["epel"]
    }

    service { "redis":
        ensure  => "running",
        enable  => true,
        require => Package["redis"],
    }

    file { "/etc/redis.conf":
        content => template("redis/redis.conf.erb"),
        owner   => root,
        group   => root,
        mode    => 0644,
        notify  => Service["redis"],
    }
}
