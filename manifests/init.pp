# == Class: couchdb
#
# This module manages couchdb. 
#
# === 'local.ini' Parameters:
#
# [*bind_address*]                - 127.0.0.1
#
# [*database_dir*]                - /var/lib/couchdb
#
# [*delayed_commits*]             - true ; set this to false to ensure an fsync before 201 Created is returned
#
# [*document_size_unit*]          - bytes
#
# [*include_sasl*]                - true
#
# [*log_file*]                    - /var/log/couchdb/couch.log
#
# [*log_level_local*]             - info
#
# [*max_attachment_chunk_size*]   - 4294967296 ;4GB
#
# [*max_connections*]             - 2048
#
# [*max_document_size*]           - 4294967296 ;4GB
#
# [*max_dbs_open*]                - 100
#
# [*os_process_timeout*]          - 5000 ; 5 seconds. for view and external servers.
#
# [*port*]                        - 5984
#
# [*require_valid_user*]      - If you set this to true, you should also uncomment the WWW-Authenticate
#
# [*uri_file*]                    - /var/lib/couchdb/couch.uri
#
# [*util_driver_dir*]             - /usr/lib64/erlang/lib/couch-1.0.4/priv/lib
#
# [*view_index_dir*]              - /var/lib/couchdb
#
#
# [**]  -
#
#
# === Requires:
#  puppetlabs-stdlib - https://github.com/puppetlabs/puppetlabs-stdlib
#
#  Packaged couchdb
#    - RHEL: EPEL or custom package
#    - Debian/Ubuntu: Default Install or custom package (not supported)
#    - SuSE: Default Install or custom package (not supported)
#
#  stdlib
#    - puppetlabs-stdlib module >= 0.1.6
#    - plugin sync enabled to obtain the anchor type
#
# === Author:
#
# Twitter:  @jonbrouse 
# Github:   /jonbrouse
#
# To Do:   
#    WWW Auth
#    Debian/Ubuntu and SuSe support
#
# === Sample Usage:
#
#  class { couchdb:
#  }
#
#
class couchdb (

  $admin_name                 = $couchdb::params::admin_name,
  $admin_password             = $couchdb::params::admin_password,
  $allow_jsonp                = $couchdb::params::allow_jsonp,
  $authentication_handlers    = $couchdb::params::authentication_handlers,
  $bind_address               = $couchdb::params::bind_address,
  $database_dir               = $couchdb::params::database_dir,
  $default_handler            = $couchdb::params::default_handler,
  $delayed_commits            = $couchdb::params::delayed_commits,
  $document_size_unit         = $couchdb::params::document_size_unit,
  $include_sasl               = $couchdb::params::include_sasl,
  $javascript                 = $couchdb::params::javascript,
  $log_file                   = $couchdb::params::log_file,
  $log_level                  = $couchdb::params::log_level,
  $log_max_chunk_size         = $couchdb::params::log_max_chunk_size,
  $max_attachment_chunk_size  = $couchdb::params::max_attachment_chunk_size,
  $max_connections            = $couchdb::params::max_connections,
  $max_dbs_open               = $couchdb::params::max_dbs_open,
  $max_document_size          = $couchdb::params::max_document_size,
  $os_process_timeout         = $couchdb::params::os_process_timeout,
  $port                       = $couchdb::params::port,
  $reduce_limit               = $couchdb::params::reduce_limit,
  $require_valid_user         = $couchdb::params::require_valid_user,
  $service_enable             = true,
  $secure_rewrites            = $couchdb::params::secure_rewrites,
  $util_driver_dir            = $couchdb::params::util_driver_dir,
  $uri_file                   = $couchdb::params::uri_file,
  $vhost_global_handlers      = $couchdb::params::vhost_global_handlers,
  $view_index_dir             = $couchdb::params::view_index_dir,

) inherits couchdb::params {

  include rpmrepos
  
  class { 'couchdb::package': 
    notify => Class['couchdb::service'],
  }

 class { 'couchdb::config':
    require => Class['couchdb::package'],
    notify  => Class['couchdb::service'],
  }
  
  class { 'couchdb::service': }
}


