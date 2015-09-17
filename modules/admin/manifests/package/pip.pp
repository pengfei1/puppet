class admin::package::pip {

  Exec {
    path    => ['/usr/bin', '/usr/local/bin', '/bin/'],
  }

  if versioncmp($::pip_version,'7.0.0') < 0 {
      exec { "install-pip${python_version}":
        command => "pip install -U pip",
        onlyif  => "which python",
      }
  }
}
