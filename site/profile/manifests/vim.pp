class profile::vim{
  package{'vim':
    ensure => present
  }
  file {'/home/demouser/.vimrc':
    ensure => file,
    owner => 'demouser',
    group => 'demouser',
    content => 'set number'
  }
  
}
