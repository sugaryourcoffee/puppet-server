class ganglia::staging {
  class { '::ganglia::client::install':        } ->
  class { '::ganglia::client::config_staging': } ->
  class { '::ganglia::client::service':        } ->
  Class["ganglia::staging"]
}
