class dynamic2{
  package{['httpd', 'php']:
    ensure => installed
  }
  file {'/var/www/php':
    ensure => directory
  }
}
