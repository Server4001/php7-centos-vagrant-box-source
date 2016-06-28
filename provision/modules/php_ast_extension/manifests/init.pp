class php_ast_extension {
    $extension_build_directory = "/opt"
    $extension_modules_folder = "/usr/lib64/php/modules"

    vcsrepo { "php-ast":
        name     => "$extension_build_directory/php-ast",
        ensure   => "present",
        owner    => vagrant,
        group    => vagrant,
        provider => git,
        source   => "https://github.com/nikic/php-ast.git",
        revision => "master",
    }

    exec { "php-ast-compile":
        command => "phpize && ./configure && make && make install && make clean && phpize --clean",
        timeout => 120,
        path    => "/usr/bin:/usr/local/bin:/usr/sbin:/usr/local/sbin:/bin",
        cwd     => "$extension_build_directory/php-ast",
        creates => "$extension_modules_folder/ast.so",
        require => [Vcsrepo["php-ast"], Class["::php::fpm::daemon"]],
    }

    file { ["/etc/php.d/ast.ini", "/etc/php-zts.d/ast.ini"]:
        content => template("php_ast_extension/ast.ini.erb"),
        owner   => root,
        group   => root,
        mode    => 0644,
        require => Exec["php-ast-compile"],
    }
}
