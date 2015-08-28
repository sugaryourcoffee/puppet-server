class ganglia::server::config {
  file { "/etc/apache2/conf-available/ganglia.conf":
    ensure => link,
    target => "/etc/ganglia-webfrontend/apache.conf",
  }

  exec { "enable-ganglia-apache-conf":
    command => "/usr/sbin/a2enconf -q ganglia",
    require => File["/etc/apache2/conf-available/ganglia.conf"],
    notify  => Class["apache::service"],
    unless  => "/usr/bin/test -f /etc/apache2/conf-enabled/ganglia.conf",
  }

  file { "/etc/ganglia/gmond.conf":
    source  => "puppet:///modules/ganglia/gmond.conf",
    owner   => "root",
    group   => "root",
    mode    => 644,
    require => Class["ganglia::server::install"],
    notify  => Class["ganglia::server::service"],
  }

  file { "/etc/ganglia/gmetad.conf":
    source  => "puppet:///modules/ganglia/gmetad.conf",
    owner   => "root",
    group   => "root",
    mode    => 644,
    require => Class["ganglia::server::install"],
    notify  => Class["ganglia::server::service"],
  }
}

