class ganglia::client::install {
  package { "ganglia-monitor":
    ensure => installed,
  }
}

