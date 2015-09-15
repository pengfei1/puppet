class puppet::master {
    #puppetdb_server address
    File {
        owner => 'puppet',
        group => 'puppet',
        mode  => '0755',
    }
    file { '/usr/local/bin/pull-update':
        source => 'puppet:///modules/puppet/pull-updates.sh',
    }
#    file { '/etc/puppet/puppet.conf':
#        content => template('puppet/puppet-master.conf.erb'),
#    }
    file { '/etc/puppet/autosign.conf':
        content => template('puppet/autosign.conf.erb'),
    }
#    cron { 'run-puppet':
#        ensure  => 'present',
#        user    => 'puppet',
#        command => '/usr/local/bin/pull-updates',
#        minute  => '*/10',
#        hour    => '*',
#    }
    service { 'apache2' :
        ensure      => running,
        hasrestart  => true,
        require     => [File['/etc/puppet/autosign.conf']],
    }
    file { '/etc/puppet/hiera.yaml':
        source => 'puppet:///modules/puppet/hiera.yaml',
        mode   => '0755',
    }
    file { '/etc/hiera.yaml':
        ensure  => link,
        target  => '/etc/puppet/hiera.yaml',
        require => File['/etc/puppet/hiera.yaml'],
        notify  => Service['apache2']
    }
    package { 'facter':
        ensure => '2.4.4-1puppetlabs1',
        notify => Service['apache2'],
    }
}
