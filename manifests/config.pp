# Class: couchdb::config
#
# This module manages couchdb configuration
#
# Parameters:
#
# There are no default parameters for this class.
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
# This class file is not called directly
class couchdb::config {

  include couchdb::params

  File {
    owner => 'couchdb',
    group => 'root',
    mode  => '0644',
  }

  file { $couchdb::couchdb_conf_dir:
    ensure => directory,
  }

  file { "${couchdb::couchdb_conf_dir}/default.ini":
    ensure  => file,
    content => template('couchdb/default.ini.erb'),
  }

}
