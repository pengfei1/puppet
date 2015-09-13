class puppet::master {
    #puppetdb_server address
    $puppetdb_server = hiera("puppetdb_server", "dev1.m.com")
    #通过github更新
    File {
        owner => 'puppet',
        group => 'puppet',
        mode  => '0755',
    }
    file { '/usr/local/bin/pull-update':
        source => 'puppet:///modules/puppet/pull-updates.sh',
    }
    #master配置文件
    file { '/etc/puppet/puppet.conf':
        content => template('puppet/puppet-master.conf.erb'),
    }
    file { '/etc/puppet/autosign.conf':
        content => template('puppet/autosign.conf.erb'),
    }
    file { '/etc/puppet/puppetdb.conf':
        content => template('puppet/puppetdb.conf.erb'),
        notify  => Service['apache2'],
    }
    file { '/etc/puppet/routes.yaml':
        source => 'puppet:///modules/puppet/routes.yaml',
        notify  => Service['apache2'],
    }
    cron { 'run-puppet':
        ensure  => 'present',
        user    => 'puppet',
        command => '/usr/local/bin/pull-updates',
        minute  => '*/10',
        hour    => '*',
    }
    package { 'puppetdb-termini':
        ensure => 'latest',
        notify => Service['apache2']
    }
    service { 'apache2' :
        ensure      => running,
        hasrestart  => true,
        require     => [File['/etc/puppet/autosign.conf'], File['/etc/puppet/puppet.conf']],
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
