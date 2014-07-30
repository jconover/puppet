class mysql::service (
  $enable,
  $ensure,
){
  #  service { 'mysql':
    service { 'mysqld':
    ensure     => $ensure,
    hasstatus  => true,
    hasrestart => true,
    enable     => $enable,
    require    => Class['mysql::config'],
  }
}
