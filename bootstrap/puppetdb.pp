class { 'puppetdb':
    listen_address => "$fqdn",
}
class { 'puppetdb::globals':
    version => '2.3.7-1puppetlabs1'
}
class {'puppetdb::master::config':
    puppet_service_name => 'apache2',
}
