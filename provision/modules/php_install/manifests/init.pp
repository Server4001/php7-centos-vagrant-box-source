class php_install {
    class { "php::common":
        common_package_name => "php70w-common",
        require             => Yumrepo["webtatic"],
    }

    php::ini { "/etc/php.ini":
        display_errors => "On",
        memory_limit   => "256M",
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
        # TODO : Add ensure => "installed",
        require => Class["php::cli"],
    }

    class { "::php::fpm::daemon":
        package_name => "php70w-fpm",
        log_owner    => "vagrant",
        log_group    => "vagrant",
        require      => Class["php::common"],
    }

    php::fpm::conf { "www":
        package_name    => "php70w-fpm",
        listen          => "/var/run/php-fpm/www.socket",
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
