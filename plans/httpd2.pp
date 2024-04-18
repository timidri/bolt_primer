plan bolt_primer::httpd2(
  TargetSpec $targets,
  Enum['install', 'remove'] $action,
) {
  apply_prep($targets)

  if $action == 'install' {
    $package_ensure = 'installed'
    $service_ensure = 'running'
  } else {
    $package_ensure = 'absent'
    $service_ensure = 'stopped'
  }
  apply($targets) {
    notice($facts['os']['name'])
    package { 'httpd':
      ensure            => $package_ensure,
      # FIXME: uninstalling doesn't seem to work on AlmaLinux 8
      # even adding the --nodeps option doesn't help
      uninstall_options => ['--nodeps'],
    }
    service { 'httpd':
      ensure => $service_ensure,
    }
  }
}
