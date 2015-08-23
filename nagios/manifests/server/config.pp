class nagios::server::config {
  file { "/etc/nagios3/apache2.conf":
    source => "puppet:///modules/nagios/apache2.conf",
    owner  => root,
    group  => root,
    mode   => 644,
    notify => Class["apache::service"],
  }
  file { "/etc/nagios3/htpasswd.users":
    source => "puppet:///modules/nagios/htpasswd.users",
    owner  => www-data,
    group  => nagios,
    mode   => 640,
    require => Class["nagios::server::install"],
  }
  file { "/etc/nagios3/nagios.cfg":
    source  => "puppet:///modules/nagios/nagios.cfg",
    owner   => nagios,
    group   => nagios,
    mode    => 644,
    require => Class["nagios::server::install"],
    notify  => [Class["apache::service"], Class["nagios::server::service"]],
  }
  file { "/var/lib/nagios3/rw":
    ensure   => directory,
    owner    => nagios,
    group    => www-data,
    mode     => 710,
    require  => Class["nagios::server::install"],
  }
  file { "/etc/nagios3/conf.d":
    source  => "puppet:///modules/nagios/conf.d/",
    ensure  => directory,
    owner   => nagios,
    group   => nagios,
    mode    => 0644,
    recurse => true,
    notify  => Class["nagios::server::service"],
    require => Class["nagios::server::install"],
  }
  file { "/etc/nagios3/conf.d/localhost_nagios2.cfg":
    ensure => absent,
  }
  user { "www-data":
    groups  => "nagios",
    notify  => Class["apache::service"],
    require => Class["nagios::server::install"],
  }
}
