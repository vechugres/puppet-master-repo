node default{
  include role::dev_machine
}

node 'slave2.puppet'{
  
  package { ['httpd', 'php']:
    provider => yum,
    ensure => isntalled,
    install_options => ['-d 10'],

  }
  #include role::web_server


}
