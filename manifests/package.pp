# Class: couchdb::package

class couchdb::package (
  $ensure = 'installed',
) {
  package { 'couchdb':
    ensure  => $ensure,
    require => Yumrepo['epel'],
  }
}
