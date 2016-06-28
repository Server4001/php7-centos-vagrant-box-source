class common_packages {
    package { ["vim-enhanced", "git", "tree", "screen", "gcc", "gcc-c++"]:
        ensure => "installed",
    }
}
