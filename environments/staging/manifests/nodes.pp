class base {
  include sudo
  include ssh
  include base::tree
}

node 'puppet.pro-puppet.com' {
  include base
}

node 'node1.pro-puppet.com' {
  include base
}

node 'webrh01.pro-puppet.com' {
  include base

  apache::vhost { 'www.pro-puppet.com':
    port          => '80',
    docroot       => '/var/www/www.pro-puppet.com',
    ssl           => false,
    priority      => '10',
    serveraliases => 'home.pro-puppet.com',
  }
}

node 'dbrh01.pro-puppet.com' {
  include sudo
  include base
  include mysql
}

node 'mailrh01.pro-puppet.com' {
  include base
  include postfix
}
