# Class: couchdb::service

class couchdb::service {
  service { 'couchdb':
    ensure      => running,
    enable      => true,
    hasstatus   => true,
    hasrestart  => true,
    require     => Package[ 'couchdb' ]
  }
}