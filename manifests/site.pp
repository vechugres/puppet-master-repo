node default{
  include role::dev_machine
}

node 'slave2.puppet'{
  
  package { ['httpd', 'php']:
    provider => yum,
    ensure => isntalled,
    install_options => ['-y'],

  }
  #include role::web_server


}
