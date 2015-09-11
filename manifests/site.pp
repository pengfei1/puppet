$puppetmaster = hiera('puppetmaster', 'dev1.m.com')
$puppetrole = $puppetmaster ? {
    $puppetmaster => 'puppet-master',
    default       => 'puppet-agent',
}
node default{
    hiera_include('classes')
}
