class sss::params ( 
      $sssd_conf = hiera("sss::params::sssd_conf", "puppet:///modules/$module_name/sssd.conf"),
      $ldap_conf  =  hiera("sss::params::ldap_conf",  "puppet:///modules/$module_name/ldap.conf"),
      $pam_system_auth = hiera ("sss::params::pam_system_auth", "puppet:///modules/$module_name/pam_system_auth"),
      $pam_password_auth  = hiera("sss::params::pam_password_auth","puppet:///modules/$module_name/pam_password_auth"),
      $realmreaderkeytab = hiera("sss:params::realmreaderkeytab", "puppet:///modules/$module_name/realmreader.keytab")
)
{ 
#   notify { "This class requires a manual keytab to be created with adreader@PHYSICS.OX.AC.UK.. ": }
}
