class hbase::thrift {
    file { '/etc/init.d/hbase-thrift' :
        source => 'puppet:///modules/hbase/hbase-thrift-daemon.sh',
        mode   => '0755',
    }

    service { 'hbase-thrift' :
        ensure      => running,
        enable      => true,
        hasrestart  => true,
        require     => File['/etc/init.d/hbase-thrift'],
    }
}
