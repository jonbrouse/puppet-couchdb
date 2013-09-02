# == Class: couchdb
#
# This module manages couchdb. 
#
# === 'local.ini' Parameters:
#
# [*bind_address*]            - 127.0.0.1
#
# [*document_size_unit*]      - bytes
#
# [*log_level_local*]         - debug
#
# [*max_document_size*]       - 4294967296
#
# [*port*]                    - 5984
#
# [*require_valid_user*]      - If you set this to true, you should also uncomment the WWW-Authenticate
#
# [*WWW-Authenticate*]        - enabled/disabled basic-auth popup on unauthorized requests. READ THE NEXT 3 LINES.
#
# [*WWW-Authenticate-realm*]  - Basic realm="administrator" basic-auth must be set to *enabled*
#
# === 'default.ini' Parameters:
#
# [*bind_address*]                - 127.0.0.1
#
# [*database_dir*]                - /var/lib/couchdb
#
# [*delayed_commits*]             - true ; set this to false to ensure an fsync before 201 Created is returned
#
# [*include_sasl*]                - true
#
# [*log_file*]                    - /var/log/couchdb/couch.log
#
# [*log_level_default*]           - info
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
#   From local.ini - 
#     vhost.erb/vhost.pp/etc
#     admin.erb/admin.pp/etc
#   From default.ini -
#     Finish everything after the logs section
#   
#   Debian/Ubuntu and SuSe support
#   continue being awesome
#
# === Sample Usage:
#
#  class { couchdb:
#  }
#
#
class couchdb (
  $port               = $couchdb::params::port,
  

) inherits couchdb::params {

  include stdlib


}
