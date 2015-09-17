class{ 'apache' : }
class { 'apache::mod::wsgi': }
class { 'puppetboard':
	manage_virtualenv => true,
}
class { 'puppetboard::apache::vhost':
 vhost_name => "pboard.${::domain}",
 port       => 80,
}
