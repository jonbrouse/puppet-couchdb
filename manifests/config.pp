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

  file { "${couchdb::couchdb_conf_dir}/local.ini":
    ensure  => file,
    content => template('couchdb/local.ini.erb'),
  }

  # If uuid is missing from the config (as in the above local.ini template),
  # couchdb will write the uuid in the last-read config file upon (re)start.
  # Usually, that means puppet is going to replace the local.ini again because
  # it changed. Therefore we provide this special workaround config file.
  file { "${couchdb::couchdb_conf_dir}/local.d/zzz-uuid.ini":
    replace => no,
    content => '[couchdb]',
  }
}
