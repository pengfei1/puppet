class { 'puppetdb':
    listen_address => "0.0.0.0",
}
class {'puppetdb::master::config':
    puppet_service_name => 'apache2',
}
