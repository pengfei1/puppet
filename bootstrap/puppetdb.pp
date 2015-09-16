class { 'puppetdb':
    listen_address => "$fqdn",
}
class {'puppetdb::master::config':
    puppet_service_name => 'apache2',
}
