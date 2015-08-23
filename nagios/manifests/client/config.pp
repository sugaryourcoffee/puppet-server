class nagios::client::config {
  file { "/etc/nagios/nrpe.cfg":
    source => "puppet:///modules/nagios/nrpe.cfg",
    owner  => root,
    group  => root,
    mode   => 644,
  }
  file { "/usr/lib/nagios/plugins/check_passenger":
    source => "puppet:///modules/nagios/plugins/check_passenger",
    owner  => nagios,
    group  => nagios,
    mode   => 755,
  }
  service { "nagios-nrpe-server":
    ensure    => true,
    enable    => true,
    subscribe => File["/etc/nagios/nrpe.cfg"],
  }
}
