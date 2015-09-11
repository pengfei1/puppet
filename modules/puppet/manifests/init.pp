# == Class: test
#
# Full description of class test here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'test':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2015 Your name here, unless otherwise noted.
#
class puppet {
    $puppetmaster = hiera('puppetmaster', 'dev1.m.com')
    file { '/usr/local/bin/pull-update':
        source => 'puppet:///modules/puppet/pull-updates.sh',
        mode   => '0755',
    }
    file { '/etc/puppet/puppet.conf':
        content => template('puppet/puppet-master.conf.erb'),
        mode    => '0755',
    }
    file { '/etc/puppet/autosign.conf':
        content => template('puppet/autosign.conf.erb'),
        mode    => '0755',
    }
    cron { 'run-puppet':
        ensure  => 'present',
        user    => 'puppet',
        command => '/usr/local/bin/pull-updates',
        minute  => '*/10',
        hour    => '*',
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
}
