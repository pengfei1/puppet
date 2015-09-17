class admin::package::pip {
  $get_pip_url = 'https://bootstrap.pypa.io/get-pip.py'

  Exec {
    path    => ['/usr/bin', '/usr/local/bin', '/bin/'],
    require => Package['curl'],
  }

  exec { "install-pip${python_version}":
    command => "curl -L ${get_pip_url} | python",
    unless  => "which pip",
    onlyif  => "which python",
  }
}
