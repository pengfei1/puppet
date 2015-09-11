class puppet::agent {
    $puppetmaster = hiera("puppetmaster")
    service { 'puppet' :
        ensure => running,
        hasrestart => true,
        require => [File['/etc/puppet/puppet.conf']]
    }
    file { '/etc/puppet/puppet.conf':
        content => template('puppet/puppet-agent.conf.erb'),
        mode    => '0755',
    }
}

