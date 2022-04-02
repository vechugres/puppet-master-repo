node default{
 include role::dev_machine 
} 

node /slave\d\.puppet/{
 include role::web_server
}



class dev_user_nemo (
  $pswd = '$1$Gdi1eg83$lCTP35NrycMk.MO7WQ5Ut1',
  $grps = ['wheel']
){
  class {'dev_user':
    usrnm => 'nemo',
    pswd => $pswd,
    grps =>  $grps
  }
  
  include dev_editor
}

