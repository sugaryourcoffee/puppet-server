class ganglia::server::config {
  file { "/etc/apache2/conf-available/ganglia.conf":
    ensure => link,
    target => "/etc/ganglia-webfrontend/apache.conf",
  }

  exec { "enable-ganglia-apache-conf":
    command => "/usr/sbin/a2enconf -q ganglia",
    require => File["/etc/apache2/conf-available/ganglia.conf"],
    notify  => Class["apache::service"],
  }
}

