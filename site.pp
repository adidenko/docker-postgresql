$fuel_settings = parseyaml($astute_settings_yaml)
$fuel_version = parseyaml($fuel_version_yaml)

$postgres_default_version = '8.4'

# nailgun db
$database_name = "nailgun"
$database_engine = "postgresql"
$database_port = "5432"
$database_user = "nailgun"
$database_passwd = "nailgun"

# ostf db
$dbuser   = 'ostf'
$dbpass   = 'ostf'
$dbname   = 'ostf'

# postgresql server
class { 'postgresql::server':
  config_hash => {
    'ip_mask_allow_all_users' => '0.0.0.0/0',
    'listen_addresses'        => '0.0.0.0',
  },
}

class { "nailgun::database":
  user      => $database_user,
  password  => $database_passwd,
  dbname    => $database_name,
}

postgresql::db{ $dbname:
  user     => $dbuser,
  password => $dbpass,
  grant    => 'all',
  require => Class['::postgresql::server'],
}
