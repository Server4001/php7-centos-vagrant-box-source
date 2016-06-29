class nginx {
    $php_socket_path = "/var/run/php-fpm/www.socket"

    package { "nginx":
        ensure  => "installed",
        require => Yumrepo["nginx"],
    }

    service { "nginx":
        ensure  => "running",
        enable  => true,
        require => Package["nginx"],
    }

    file { "html_folder":
        path   => "/var/www/html",
        ensure => "directory",
        owner  => "vagrant",
        group  => "vagrant",
        mode   => 0755,
    }

    file { "fastcgi_params":
        path    => "/etc/nginx/fastcgi_params",
        content => template("nginx/fastcgi_params.erb"),
        owner   => "root",
        group   => "root",
        mode    => 0644,
        notify  => Service["nginx"],
    }

    file { "config_nginx":
        path    => "/etc/nginx/nginx.conf",
        content => template("nginx/nginx.conf.erb"),
        owner   => "root",
        group   => "root",
        mode    => 0644,
        notify  => Service["nginx"],
    }

    file { "config_default_host":
        path    => "/etc/nginx/conf.d/default.conf",
        content => template("nginx/default.conf.erb"),
        owner   => "root",
        group   => "root",
        mode    => 0644,
        notify  => Service["nginx"],
    }
}
