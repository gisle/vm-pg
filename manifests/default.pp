package { [ "postgresql" ]:
  ensure => present,
}

service { "postgresql":
  ensure => running,
  require => Package["postgresql"],
}

file { "pg_hba.conf":
  path => "/etc/postgresql/9.1/main/pg_hba.conf",
  notify => Service["postgresql"],
  ensure => present,
  source => "/vagrant/pg_hba.conf",
  owner => "postgres",
  group => "postgres",
}
