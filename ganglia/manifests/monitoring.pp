class ganglia::monitoring {
  class { '::ganglia::client::install':           } ->
  class { '::ganglia::client::config_monitoring': } ->
  class { '::ganglia::client::service':           } ->
  Class["ganglia::monitoring"]
}

