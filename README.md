# oxphys-sss 
Module to configure sss(d) AND ldap AND pam

You will need to setup your own parameters.  SSSD normally needs to have a keytab to perform GSSAPI authentication against the ldap server and therefore you will need to create your own in an external location.

Parameters:

      "sss::params::sssd_conf" basic sssd_config file, defaults to the one we use in physics and stored in the files directory of the module
      "sss::params::ldap_conf" basic ldap.conf file, defaults to the one we use in physics and stored in the files directory of the module
      "sss::params::pam_system_auth" pam module config to allow for sss and unix authentication 
      "sss::params::pam_password_auth" pam module config to allow for sss and unix authentication
      "sss:params::realmreaderkeytab" his is a keytab that must contain a user allowed to read from your organisations ldap server. The sssd conf file must refer to this user this is.

