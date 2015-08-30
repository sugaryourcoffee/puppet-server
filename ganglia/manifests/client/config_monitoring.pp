class ganglia::client::config_monitoring {
  file { "/etc/ganglia/gmond.conf":
    source  => "puppet:///modules/ganglia/gmond-monitoring.conf",
    owner   => "root",
    group   => "root",
    mode    => 644,
    require => Class["ganglia::client::install"],
    notify  => Class["ganglia::client::service"],
  }
}

