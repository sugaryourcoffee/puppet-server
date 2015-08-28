class ganglia::server::service {
  service { "ganglia-monitor":
    hasrestart => true,
  }

  service { "gmetad":
    hasrestart => true,
  }
}
