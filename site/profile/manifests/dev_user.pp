class profile::dev_user (
$usrnm = 'demouser',
$pswd = '$1$Gdi1eg83$lCTP35NrycMk.MO7WQ5Ut1',
$grps = ['wheel']

){
   group { $grps:
     ensure => present
  }
  
   user {$usrnm:
     ensure => present,
     managehome => true,
     groups => $grps,
     password => $pswd
   }
}
