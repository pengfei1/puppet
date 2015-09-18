define ssh_user($key = undef, $keytype = "ssh-rsa", $role = "dev"){
    user { "$name":
        ensure => present,
        shell   => '/bin/bash',
    }
    file {["/home/${name}", "/home/${name}/.ssh"]:
        ensure => directory,
        mode => '0700',
        owner => $name,
        require => User["${name}"]
    }
    if $key != nodef {
        ssh_authorized_key { "${name}_key":
            key     => $key,
            type    => "$keytype",
            user    => $name,
            require => File["/home/${name}/.ssh"],
        }
    }   

    if $role == "admin" {
        file { "/etc/sudoers.d/${name}":
            ensure  => present,
            content => template("admin/sudoer.conf.erb")
        }
    }
    else
    {
        file { "/etc/sudoers.d/${name}":
            ensure  => absent,
        }
    }

}
class admin::user{
    $sysusers = hiera('users')
    create_resources(ssh_user, $sysusers)
}
