node default{
  file { '/root/README':
    ensure => file,
    content => 'Hello, World!',
  }
  class{'dev_user':
    password => '$1$82O96PFM$8avkFBH/CitHmrE9rEtjb1'
  }
  include dev_editor
}

class dev_user(
  $usrnm = 'demouser',
  $pswd = '$1$Gdi1eg83$lCTP35NrycMk.MO7WQ5Ut1',
  $grps = ['wheel']
){
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
