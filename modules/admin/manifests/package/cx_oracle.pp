class admin::package::cx_oracle {
    include admin::package::virtual
    realize(Package['build-essential']
    realize(Package['unzip']
    realize(Package['libaio-dev']
    realize(File['/root/.setup'])
    file {'/root/.setup/instantclient-sdk-linux-x86-64-11.2.0.2.0.zip':
        ensure  => present,
        source  => 'puppet:///modules/admin/instantclient-sdk-linux-x86-64-11.2.0.2.0.zip',
        mode    => "755'
    }
    file {'/root/.setup/instantclient-basic-linux-x86-64-11.2.0.2.0.zip':
        ensure  => present,
        source  => 'puppet:///modules/admin/instantclient-basic-linux-x86-64-11.2.0.2.0.zip',
        mode    => "755'
    }
    file {'/root/.setup/install_cx_oracle':
        ensure  => present,
        source  => "puppet:///modules/admin/install_cx_oracle",
        mode    => "755"
    }
    exec {"bash /root/.setup/install_cx_oracle":
        require => [File['/root/.setup/instantclient-sdk-linux-x86-64-11.2.0.2.0.zip'], File['/root/.setup/instantclient-basic-linux-x86-64-11.2.0.2.0.zip'], File['/root/.setup/install_cx_oracle']],
        unless  => "pip show cx-oracle"
    }
}
