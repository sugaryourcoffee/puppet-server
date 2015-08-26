class ganglia::server {
  class { '::ganglia::server::install': } ->
  class { '::ganglia::server::config':  } ->
  Class['ganglia::server']
}
