node 'dev1.m.com' {
    include puppet::master
}
node default{
    hiera_include('classes')
}
