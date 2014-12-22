# Class: couchdb::package

class couchdb::package {
  package { 'couchdb':
    ensure  => $::couchdb::package_ensure,
    require => Yumrepo['epel'],
  }
}
