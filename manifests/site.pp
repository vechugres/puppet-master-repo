node default{
  include role::dev_machine
}

node 'slave2.puppet'{
  
  package { ['httpd', 'php']:
    provider => dnf,
    ensure => isntalled,
  }
  #include role::web_server


}
