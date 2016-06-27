class firewall {
    service { ["iptables", "ip6tables"]:
        ensure  => "stopped",
        enable  => false,
    }
}
