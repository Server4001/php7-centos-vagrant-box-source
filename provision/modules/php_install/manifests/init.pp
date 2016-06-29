class php_install {
    $php_socket_path = "/var/run/php-fpm/www.socket"

    class { "php::common":
        common_package_name => "php70w-common",
        require             => Yumrepo["webtatic"],
    }

    php::ini { "/etc/php.ini":
        display_errors      => "On",
        memory_limit        => "128M",
        post_max_size       => "999M",
        upload_max_filesize => "999M",
        date_timezone       => "America/Los_Angeles",
    }

    class { "php::cli":
        ensure           => "installed",
        cli_package_name => "php70w-cli",
        inifile          => "/etc/php.ini",
        require          => Class["php::common"],
    }

    php::module {
        [
            "php70w-opcache",
            "php70w-devel",
            "php70w-gd",
            "php70w-intl",
            "php70w-mbstring",
            "php70w-mcrypt",
            "php70w-mysqlnd",
            "php70w-pdo",
            "php70w-pear",
            "php70w-pecl-imagick",
            "php70w-pecl-xdebug",
            "php70w-soap",
            "php70w-xml",
            "php70w-xmlrpc",
        ]:
        require => Class["php::cli"],
    }

    file { "/etc/php.d/xdebug.ini":
        content => template("php_install/xdebug.ini.erb"),
        owner   => root,
        group   => root,
        mode    => 0644,
        require => Class["php::common"],
    }

    file { "/etc/php-zts.d/xdebug.ini":
        content => template("php_install/xdebug-zts.ini.erb"),
        owner   => root,
        group   => root,
        mode    => 0644,
        require => Class["php::common"],
    }

    class { "::php::fpm::daemon":
        package_name => "php70w-fpm",
        log_owner    => "vagrant",
        log_group    => "vagrant",
        require      => Class["php::common"],
    }

    php::fpm::conf { "www":
        package_name    => "php70w-fpm",
        listen          => $php_socket_path,
        user            => "vagrant",
        group           => "vagrant",
        listen_owner    => "vagrant",
        listen_group    => "vagrant",
        listen_mode     => 0660,
        pm_max_requests => 500,
        require         => Class["php::common"],
        php_value       => {
            "session.save_handler" => "files",
            "session.save_path"    => "/var/lib/php/session",
            "soap.wsdl_cache_dir"  => "/var/lib/php/wsdlcache",
        },
    }
}
