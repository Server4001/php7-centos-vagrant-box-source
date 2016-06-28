class beanstalkd {
    package { "beanstalkd":
        ensure  => "installed",
        require => Yumrepo["epel"]
    }

    service { "beanstalkd":
        ensure  => "running",
        enable  => true,
        require => Package["beanstalkd"],
    }

    file { "/etc/sysconfig/beanstalkd":
        content => template("beanstalkd/beanstalkd.erb"),
        owner   => root,
        group   => root,
        mode    => 0644,
        notify  => Service["beanstalkd"],
    }
}
