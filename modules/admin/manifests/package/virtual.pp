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
    @package {["zip", "libxml2-dev", "libxslt-dev", "zlib1g-dev", "lrzsz", "build-essential", "autoconf", "libtool", "pkg-config", "unzip", "libaio-dev"]:
        ensure => installed,
        tag    => "apt-basic"
    }
    @libssl { "libssl-install":
    }
    @package {["ujson", "python-dateutil", "lxml", "thrift", "pymongo", "pyes"]:
        ensure      => installed,
        provider    => pip,
        tag         => "pip-basic"
    }
    @file { "/root/.setup":
        ensure => directory,
    }
}
