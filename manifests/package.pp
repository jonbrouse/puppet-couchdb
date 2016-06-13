# Class: couchdb::package

class couchdb::package {
  package { 'couchdb':
    ensure  => $::couchdb::package_ensure,
  }

  if $::couchdb::manage_epel_repo {
    Package['couchdb'] {
      require +> Yumrepo['epel'],
    }
  }
}
