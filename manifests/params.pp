# Class: couchdb::params
#
#   The couchdb configuration settings.
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
class couchdb::params {

  case $::osfamily {
    'RedHat': {
      $server_package_name = 'couchdb'
    }
    default: {
      fail("Unsupported osfamily: ${::osfamily} operatingsystem: ${::operatingsystem}, module ${module_name} only RedHat/CentOS is supported")
    }
  }
}
