define ssh_user($name, $key = node, $keytype = "ssh-rsa", $role = "dev"){
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
#    if $role == "admin" {
#        augeas { "${name}_sudo":
#            context => "/files/etc/sudoers",
#            changes => "set 
#        }
#    }

}
class admin::user{
    $admin_user = hiera('administrator', [])
    $dev_user = hiera('developer', [])
    $admin_user.each | Integer $index, String $value | {
        ssh_user($value)
    }
}
