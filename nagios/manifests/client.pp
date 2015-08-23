class nagios::client {
  class { '::nagios::client::install': } ->
  class { '::nagios::client::config':  } ->
  Class['nagios::client']
}
