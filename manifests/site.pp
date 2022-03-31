node default{
  file { '/root/README':
    ensure => file,
    content => 'Hello, World!',
  }
  include dev_user_nemo
}

node 'slave1.puppet'{
  class {'apache':}
}

class dev_user_nemo(
  $passwd = '$1$Gdi1eg83$lCTP35NrycMk.MO7WQ5Ut1',
  $groups = ['wheel']
){
  
  class {'dev_user':
    usrnm => 'nemo'
    pswd => $passwd
    grps => $groups
  }
  
  include dev_editor
}

class dev_user(
  $usrnm = 'demouser',
  $pswd = '$1$Gdi1eg83$lCTP35NrycMk.MO7WQ5Ut1',
  $grps = ['wheel']
){
  group {$grps:
    ensure => present
  }
  user {$usrnm:
    ensure => present,
    managehome => true,
    groups => $grps,
    password => $pswd
  }
}

class dev_editor {
  package {'vim':
    ensure => present
  }
  file {'/home/demouser/.vimrc':
    ensure => file,
    owner => 'demouser',
    group => 'demouser',
    content => 'set number'
  }
}
