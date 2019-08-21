plan my::httpd(
  TargetSpec $nodes,
) {
    apply_prep($nodes)
    apply($nodes) {
      package { 'httpd':
        ensure => installed,
      }
      service { 'httpd':
        ensure => running,
      }
    }
}
