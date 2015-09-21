define libssl(){
    package {"libssl1.0.0":
        ensure => installed,
    }
    file {"/lib/x86_64-linux-gnu/libssl.so.4":
        ensure  => link,
        target  => '/lib/x86_64-linux-gnu/libssl.so.1.0.0',
        require => Package['libssl1.0.0']
    }
    file {"/lib/x86_64-linux-gnu/libcrypto.so.4":
        ensure  => link,
        target  => '/lib/x86_64-linux-gnu/libcrypto.so.1.0.0',
        require => Package['libssl1.0.0']
    }
}

class admin::package::virtual {
    @package {["zip", "libxml2-dev", "libxslt1-dev", "zlib1g-dev", "lrzsz", "build-essential", "autoconf", "libtool", "pkg-config", "unzip", "libaio-dev", "python-dev"]:
        ensure => installed,
        tag    => "apt-basic"
    }
    @libssl { "libssl-install":
    }

    @package {"lxml":
        ensure      => installed,
        provider    => pip,
        tag         => "pip-basic",
        require     => [Package['python-dev'], Package['libxml2-dev'], Package['libaio-dev'], Package['libxslt1-dev'], Package['zlib1g-dev'], Package['build-essential']],
    }
        
    @package {["ujson", "python-dateutil", "thrift", "pymongo", "pyes", "pypuppetdb", "Flask", "Flask-WTF"]:
        ensure      => installed,
        provider    => pip,
        tag         => "pip-basic",
        require     => Package['python-dev'],
    }
    @file { "/root/.setup":
        ensure => directory,
    }
}
