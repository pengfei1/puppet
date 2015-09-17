class admin::package::ambari ($version = "2.1.0", $apt_key = "B9733A7A07513CAD" ){
    file {"/etc/apt/sources.list.d/ambari.list":
        ensure  => present,
        content => template("admin/ambari.${version}.list"),
        mode    => "0755",
    }
    exec { "add ambari key":
        command => "apt-key adv --recv-keys --keyserver keyserver.ubuntu.com $apt_key",
        require => File['/etc/apt/sources.list.d/ambari.list'],
    }
    exec { 'ambari apt update':
        command => "apt-get update",
        require => Exec['add ambari key'],
    }
    package {'ambari-server':
        ensure => installed,
        require => Exec['ambari apt update']
    }
    File {
        ensure  => present,
        mode    => '0755',
    }
    file {"/etc/ambari-server/setupAgent.py":
        source => "puppet:///modules/admin/setupAgent_${version}.py",
        require => Package['ambari_server'],
    }
    file {"/usr/lib/python2.6/site-packages/ambari_server/os_check_type.py":
        source => "puppet:///modules/admin/os_check_type_${version}.py",
        require => Package['ambari_server'],
    }
    file {"/usr/lib/python2.6/site-packages/ambari_commons/os_check.py":
        source => "puppet:///modules/admin/os_check_${version}.py",
        require => Package['ambari_server'],
    }
    file {"/etc/ambari-server/conf/ambari.properties":
        source => "puppet:///modules/admin/ambari_${version}.properties",
        require => Package['ambari_server'],
    }
}
