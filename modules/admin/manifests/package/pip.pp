class admin::package::pip {
  $get_pip_url = "https://bootstrap.pypa.io/get-pip.py"
  Exec {
    path    => ['/usr/bin', '/usr/local/bin', '/bin/'],
  }
  if versioncmp($::pip_version,'7.0.0') < 0 {
      exec { "install-pip${python_version}":
        onlyif  => "which python",
	command => "curl -L ${get_pip_url} | python",
      }
  }
}
