node default {
    class { 'puppetdb':
        listen_address => "$fqdn",
    }
    class { 'puppetdb::params':
        postgres_version => '9.3'
    }
    class {'puppetdb::master::config':
        puppet_service_name => 'apache2',
    }
}
