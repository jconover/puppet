class mysql::install (
  $user,
  $group
){
  $mysql_pkgs = ['mysql-server',
  'mysql-test',
  'mysql-libs' ]
  #  $mysql_pkgs = ['database/mysql-51',
  #'database/mysql-51/library',
  #'database/mysql-51/tests',
  #'database/mysql-common' ]

 package { $mysql_pkgs:
  ensure  => present,
  require => User[$user],
}

user { $user:
  ensure  => present,
  comment => 'MySQL user',
  gid     => $group,
  shell   => '/bin/false',
  require => Group[$group],
}

 group { $group:
  ensure => present,
 }
}
