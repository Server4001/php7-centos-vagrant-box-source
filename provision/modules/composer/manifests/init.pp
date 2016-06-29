class composer {
    $global_composer_directory = "/usr/local/bin"
    $global_composer_path = "$global_composer_directory/composer"

    exec { "download_composer":
        command     => "curl -sS https://getcomposer.org/installer | php -- --install-dir=$global_composer_directory",
        timeout     => 120,
        path        => "/usr/bin:/usr/local/bin:/usr/sbin:/usr/local/sbin:/bin",
        environment => "COMPOSER_HOME=/home/vagrant/.composer",
        creates     => $global_composer_path,
        require     => Class["php::common"],
    }

    exec { "move_composer_phar":
        command => "mv $global_composer_path.phar $global_composer_path",
        path    => "/usr/bin:/usr/local/bin:/usr/sbin:/usr/local/sbin:/bin",
        creates => $global_composer_path,
        require => Exec["download_composer"],
    }

    file { "make_composer_executable":
        path    => $global_composer_path,
        mode    => 0755,
        require => Exec["move_composer_phar"],
    }

    file { "/usr/bin/composer":
        ensure  => "link",
        target  => $global_composer_path,
        owner   => "root",
        group   => "root",
        require => File["make_composer_executable"],
    }
}
