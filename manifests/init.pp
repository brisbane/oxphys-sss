class sss (  
   $sssd_conf  = $sss::params::sssd_conf,
   $ldap_conf  = $sss::params::ldap_conf,
   $realmreaderkeytab = $sss::params::realmreaderkeytab,
)
inherits sss::params 
{

   $package_list = [  'krb5-libs', 'krb5-workstation','sssd']
   $servicelist = ['sssd']

   service{  $servicelist:
                   ensure => running,
                   hasstatus => true,
                   hasrestart => true,
                   enable => true,
                   require => Package[$package_list]
        }

      ensure_packages ( $package_list )

    file { '/etc/sssd/sssd.conf':
      ensure  => present,
      source  => $sssd_conf,
      require => Package['sssd'],
      owner   => 'root',
      group   => 'root',
      mode    => '0600',
      notify  => Service['sssd'],
    }
ensure_resource ( 'file', "/etc/keytabs/",
               { ensure => directory,
                 owner   => 'root',
                 group   => 'root',
                 mode    => '0700',
                } )

    file { '/etc/keytabs/krb5.keytab.adreader' : 
      ensure  => present,
      source  => $realmreaderkeytab,
      owner   => 'root',
      group   => 'root',
      mode    => '0600',
      notify  => Service['sssd'],
      require => File['/etc/keytabs']
    }

   file { '/etc/ldap.conf':
         ensure => present, 
         source  => "$ldap_conf", 
         owner   => 'root',
         group   => 'root',
         mode    => '0444',
   }

}
