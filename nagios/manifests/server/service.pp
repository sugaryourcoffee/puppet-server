class nagios::server::service {
  service { "nagios3":
    ensure => running,
    hasrestart => true,
    enable     => true,
    hasstatus  => true,
    restart    => "/etc/init.d/nagios3 reload",
    require    => Class["nagios::server::install"]
  }
}
