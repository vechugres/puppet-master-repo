node default{
  file { '/root/README':
    ensure => file,
    content => 'Hello, World!',
  }
  include dev_user
  include dev_editor
}

class dev_user {
  user {'demouser':
    ensure => present,
    managehome => true,
    groups => ['wheel'],
    password => '$1$Gdi1eg83$lCTP35NrycMk.MO7WQ5Ut1'
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
    content => 'puppet:///modules/dev_environment/vimrc'
  }
}
