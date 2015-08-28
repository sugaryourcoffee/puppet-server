class ganglia::server {
  class { '::ganglia::server::install': } ->
  class { '::ganglia::server::config':  } ->
  class { '::ganglia::server::service': } ->
  Class['ganglia::server']
}
