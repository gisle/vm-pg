exec { 'apt-get update':
  command => '/usr/bin/apt-get update',
  onlyif => "/bin/bash -c 'exit $(( $(( $(date +%s) - $(stat -c %Y /var/lib/apt/lists/$( ls /var/lib/apt/lists/ -tr1|tail -1 )) )) <= 604800 ))'",
}

package { [ "postgresql", "apache2", "phppgadmin" ]:
  ensure => present,
  require => Exec['apt-get update'],
}

service { "postgresql":
  ensure => running,
  require => Package["postgresql"],
}

service { "apache2":
  ensure => running,
  require => Package["apache2"],
}

file { "postgresql.conf":
  path => "/etc/postgresql/9.1/main/postgresql.conf",
  require => Package["postgresql"],
  notify => Service["postgresql"],
  ensure => present,
  source => "/vagrant/postgresql.conf",
  owner => "postgres",
  group => "postgres",
}

file { "pg_hba.conf":
  path => "/etc/postgresql/9.1/main/pg_hba.conf",
  require => Package["postgresql"],
  notify => Service["postgresql"],
  ensure => present,
  source => "/vagrant/pg_hba.conf",
  owner => "postgres",
  group => "postgres",
}
