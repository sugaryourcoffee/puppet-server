class nagios::server::install {
  package { ["nagios3", "nagios-nrpe-plugin"]:
    ensure => present,
  }
}
