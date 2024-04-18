plan bolt_primer::httpd(
  TargetSpec $targets,
) {
  apply_prep($targets)
  apply($targets) {
    package { 'httpd':
      ensure => installed,
    }
    service { 'httpd':
      ensure => running,
    }
  }
}
