class nginx {
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
