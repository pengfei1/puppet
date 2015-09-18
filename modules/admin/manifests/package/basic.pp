class admin::package::basic {
    include admin::package::virtual
    Package <| tag == 'apt-basic' |>
    Package <| tag == 'pip-basic' |>
    realize(Libssl['libssl-install'])

    file { "/etc/security/limits.conf":
        source => "puppet:///modules/admin/limits.conf",
        mode   => "0644",
    }
}
