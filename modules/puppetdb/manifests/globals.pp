class puppetdb::globals (
  $version                      = '2.3.7-1puppetlabs1',
  $database                     = 'postgres',
  ) {

  if !($::osfamily in ['RedHat', 'Suse', 'Archlinux', 'Debian', 'OpenBSD', 'FreeBSD']) {
    fail("${module_name} does not support your osfamily ${::osfamily}")
  }

}
