node default{
  include role::dev_machine
}

node 'slave2.puppet'{
  include role::web_server
}
