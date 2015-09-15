class admin::user{
    $admin_user = hiera('admin_user', ['f'])
    $dev_user = hiera('dev_user', ['f'])
}
