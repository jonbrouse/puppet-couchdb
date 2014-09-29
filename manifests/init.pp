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
# [*require_valid_user*]          - If you set this to true, you should also uncomment the WWW-Authenticate
#
# [*secret*]                      - The secret token used for Proxy Authentication method
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
#  metcalfc-rpmrepos - https://github.com/metcalfc/puppet-rpmrepos
#
#  Packaged couchdb
#    - RHEL/CentOS: EPEL
#    - Debian/Ubuntu: (not supported)
#    - SuSE: (not supported)
#
#
# === Author:
#
# Twitter:  @jonbrouse
# Github:   /jonbrouse
#
# === To Do:
#    - [ ] WWW Auth
#    - [ ] RHEL: Custom Package
#    - [ ] Debian/Ubuntu: Default Install
#    - [ ] Debian/Ubuntu: Custom Package
#    - [ ] SuSE: Default Install
#    - [ ] SuSE: Custom Package
#
# === Sample Usage:
#
#  class { couchdb:
#  }
#
#
class couchdb (
  $admin_name                 = 'admin',
  $admin_password             = 'admin',
  $allow_jsonp                = false,
  $authentication_handlers    = '{couch_httpd_oauth, oauth_authentication_handler}, {couch_httpd_auth, cookie_authentication_handler}, {couch_httpd_auth, default_authentication_handler}',
  $bind_address               = '127.0.0.1',
  $couchdb_conf_dir           = '/etc/couchdb',
  $database_dir               = '/var/lib/couchdb',
  $delayed_commits            = true,
  $default_handler            = '{couch_httpd_db, handle_request}',
  $document_size_unit         = 'bytes',
  $include_sasl               = true,
  $javascript                 = '/usr/bin/couchjs /usr/share/couchdb/server/main.js',
  $log_file                   = '/var/log/couchdb/couch.log',
  $log_level                  = 'info',
  $log_max_chunk_size         = '1000000',
  $max_attachment_chunk_size  = '4294967296 ;4GB',
  $max_connections            = '2048',
  $max_dbs_open               = '100',
  $max_document_size          = '4294967296',
  $os_process_timeout         = '5000 ; 5 seconds. for view and external servers.',
  $port                       = '5984',
  $reduce_limit               = true,
  $require_valid_user         = false,
  $secret                     = 'changeme',
  $secure_rewrites            = true,
  $service_enable             = true,
  $util_driver_dir            = '/usr/lib64/erlang/lib/couch-1.0.4/priv/lib',
  $uri_file                   = '/var/lib/couchdb/couch.uri',
  $vhost_global_handlers      = '_utils, _uuids, _session, _oauth, _users',
  $view_index_dir             = '/var/lib/couchdb',
) {

  include couchdb::params
  include rpmrepos::epel

  class { 'couchdb::package':
    notify => Class['couchdb::service'],
  }

  class { 'couchdb::config':
    require => Class['couchdb::package'],
    notify  => Class['couchdb::service'],
  }

  class { 'couchdb::service': }
}
