class puppet::service {
  service { 'puppet':
    ensuere    => running,
    hasstatus  => true,
    hasrestart => true,
    enable     => true,
    require    => Class['puppet::install'],
  }
}
