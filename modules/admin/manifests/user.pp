define ssh_user($username, $key = nodef, $keytype = "ssh-rsa", $role = "dev"){
    user { "$username":
	ensure => present,
	shell   => '/bin/bash',
    }
    file {["/home/${username}", "/home/${username}/.ssh"]:
	ensure => directory,
	mode => '0700',
	owner => $username,
	require => User["${username}"]
    }
    if $key != nodef {
	ssh_authorized_key { "${username}_key":
	    key     => $key,
	    type    => "$keytype",
	    user    => $username,
	    require => File["/home/${username}/.ssh"],
	}
    }   
#    if $role == "admin" {
#        augeas { "${username}_sudo":
#            context => "/files/etc/sudoers",
#            changes => "set 
#        }
#    }

}
class admin::user{
    $admin_user = hiera('administrator', [])
    $dev_user = hiera('developer', [])
    each($admin_user) |$username| {
      ssh_user { "$username":
          username => $username,
      }
    }
}
