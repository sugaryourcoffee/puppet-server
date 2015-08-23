class nagios::client::install {
  package { ["nagios-nrpe-server", "nagios-plugins"]:
    ensure => present,
  }
}
