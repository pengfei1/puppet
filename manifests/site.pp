$puppetmaster = ['dev1.m.com']
$puppetrole = $fqdn ? {
    $puppetmaster => 'puppet-master',
    default       => 'puppet-agent',
}
node default{
    hiera_include('classes')
}
