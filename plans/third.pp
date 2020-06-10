# WARNING: This is an autogenerated plan. It may not behave as expected.
plan bolt_primer::third(
  TargetSpec $hello_hosts,
  TargetSpec $goodbye_hosts,
  $message
) {
  run_command('hostname', 'all', 'Get all hostnames')
  $hello = run_task('my::hello', $hello_hosts, 'Say hello', {'message' => $message})
  run_task('my::goodbye', $goodbye_hosts, 'Say goodbye', {'message' => $message})
}