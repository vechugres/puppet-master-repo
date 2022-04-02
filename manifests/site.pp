node default{
 file { '/root/README':
   ensure => file,
   content => 'Hello, World!',
 }
 
 class {'dev_user':
   pswd => '$1$e/DwQs6J$0FSL8mFOMcBHktW84qlkN0',
   grps => ['puppet']
 }
 include dev_editor
} 


class dev_user (
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
