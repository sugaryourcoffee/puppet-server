class ganglia::client::config_staging {
  file { "/etc/ganglia/gmond.conf":
    source  => "puppet:///modules/ganglia/gmond-staging.conf",
    owner   => "root",
    group   => "root",
    mode    => 644,
    require => Class["ganglia::client::install"],
    notify  => Class["ganglia::client::service"],
  }
}

