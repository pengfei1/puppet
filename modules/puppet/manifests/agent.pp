class puppet::agent {
    $puppetmaster = hiera("puppetmaster")
    package { 'puppet':
        ensure => '3.8.2-1puppetlabs1'
    }
    package { 'facter':
        ensure => '2.4.4-1puppetlabs1',
    }
    service { 'puppet' :
        ensure => running,
        hasrestart => true,
        require => [File['/etc/puppet/puppet.conf'], Package['facter']]
    }
    file { '/etc/puppet/puppet.conf':
        content => template('puppet/puppet-agent.conf.erb'),
        mode    => '0755',
    }
}

