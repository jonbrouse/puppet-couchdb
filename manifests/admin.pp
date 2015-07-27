# define: couchdb::admin

define couchdb::admin (
  $password,
){

  require Class['couchdb::service']

  exec { 'couchdb admin':
      command => "/usr/bin/curl -X PUT http://localhost:5984/_config/admins/${title} -d '\"${password}\"'",
      unless  => "/bin/grep ^${title} ${couchdb::couchdb_conf_dir}/local.ini",
  }
}
