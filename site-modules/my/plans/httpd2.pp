plan my::httpd2(
  TargetSpec $nodes,
  Enum['install', 'remove'] $action,
) {
    apply_prep($nodes)

    if $action == 'install' {
      $package_ensure = 'installed'
      $service_ensure = 'running'
    } else {
      $package_ensure = 'absent'
      $service_ensure = 'stopped'
    }
    apply($nodes) {
      notice($facts['operatingsystem'])
      package { 'httpd':
        ensure => $package_ensure,
      }
      service { 'httpd':
        ensure => $service_ensure,
      }
    }
}
