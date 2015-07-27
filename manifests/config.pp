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

  if $couchdb::admin_name {
    exec { 'couchdb admin':
      command => "/usr/bin/curl -X PUT http://localhost:5984/_config/admins/${couchdb::admin_name} -d '\"${couchdb::admin_password}\"'",
      unless  => "/bin/grep ^${couchdb::admin_name} ${couchdb::couchdb_conf_dir}/local.ini",
      require => Service['couchdb'],
    }
  }
}
