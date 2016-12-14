class mysql_install (
  $mysql_root_password
) {
  class { 'mysql::server':
    root_password           => $mysql_root_password,
    remove_default_accounts => true,
    package_name            =>  "mysql-community-server",
    package_ensure          => "5.7.13-1.el6",
    require                 => Yumrepo["mysql-connectors-community"],
  }
}
