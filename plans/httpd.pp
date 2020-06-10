plan bolt_primer::httpd(
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
