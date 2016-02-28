# == Class: carbon_relay_ng::service
#
# Full description of class carbon_relay_ng here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'carbon_relay_ng':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2016 Your name here, unless otherwise noted.
#
class carbon_relay_ng::service {
  if !($carbon_relay_ng::service_ensure in ['running', 'stopped']) {
    fail('service_ensure parameter must be \'running\' or \'stopped\'')
  }

  if $carbon_c_relay::service_manage == true {

    service { $carbon_c_relay::service_name:
      ensure     => $carbon_c_relay::service_ensure,
      enable     => $carbon_c_relay::service_enable,
      name       => $carbon_c_relay::service_name,
      hasstatus  => true,
      hasrestart => true,
    }
  }

}
