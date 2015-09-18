stage { 'puppet-update' :
    before => Stage['main'],
}
node default{
    hiera_include('classes')
}
