class ssh::params {
  case $::osfamily {
    Solaris: {
      $ssh_package_name = 'service/network/ssh'
      $ssh_service_config = '/etc/ssh/sshd_config'
      $ssh_service_name = 'ssh'
    }
    Debian: {
      $ssh_package_name = 'openssh-server'
      $ssh_service_config = '/etc/ssh/sshd_config'
      $ssh_service_name = 'ssh'
    }
    RedHat: {
      $ssh_package_name = 'openssh-server'
      $ssh_service_config = '/etc/ssh/sshd_config'
      $ssh_service_name = 'sshd'
    }
    default: {
      fail("Module jlc-ssh does not support osfamily: ${::osfamily}")
    }
  }
}
