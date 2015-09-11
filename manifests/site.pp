$puppetmaster = hiera('puppetmaster', 'dev1.m.com')
node default{
    hiera_include('classes')
}
