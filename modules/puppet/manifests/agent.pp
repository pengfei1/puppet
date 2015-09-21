class puppet::agent {
    $puppetmaster = hiera("puppetmaster")
    package { 'puppet':
        ensure => installed,
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
    file { '/var/lib/puppet/run':
        ensure => directory,
        owner  => "puppet",
        mode   => "0755"
    }
    file { '/var/run/puppet':
        ensure => link,
        target => "/var/lib/puppet/run",
        force  => true,
    }
    class {"admin::package::pip":}
}

