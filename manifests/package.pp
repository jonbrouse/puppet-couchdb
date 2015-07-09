# Class: couchdb::package

class couchdb::package {
  package { 'couchdb':
    ensure  => installed,
  }
}
