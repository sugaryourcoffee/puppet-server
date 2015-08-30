class ganglia::client::service {
  service { "ganglia-monitor":
    hasrestart => true,
  }
}

