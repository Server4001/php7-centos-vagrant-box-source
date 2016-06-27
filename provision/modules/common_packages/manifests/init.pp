class common_packages {
    package { ["vim-enhanced", "git", "tree", "screen"]:
        ensure => "installed",
    }
}
