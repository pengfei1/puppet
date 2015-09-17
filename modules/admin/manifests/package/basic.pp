class admin::package::basic {
    include admin::package::virtual
    Package <| tag = 'apt-basic' |>
    Package <| tag = 'pip-basic' |>
    file { "/etc/security/limits.nf":
        source => "puppet:///modules/admin/limits.conf",
        mode   => "644",
    }
}
