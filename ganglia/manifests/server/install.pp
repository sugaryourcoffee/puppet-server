class ganglia::server::install {
  package { ["ganglia-monitor", "ganglia-webfrontend"]:
    ensure => installed,
  }
}
