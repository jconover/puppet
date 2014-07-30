class mysql::config (
  $user,
  $group,
){
  file { '/etc/my.cnf':
    ensure  => present,
    source  => 'puppet:///modules/mysql/my.cnf',
    owner   => $user,
    group   => $group,
    require => Class['mysql::install'],
    notify  => Class['mysql::service'],
  }
  file { '/var/mysql':
    group   => $user,
    owner   => $group,
    recurse => true,
    require => File['/etc/my.cnf'],
  }
}
