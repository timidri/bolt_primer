plan bolt_primer::aggregate_outputs (
  TargetSpec $targets,        # hosts to run the task on 
  TargetSpec $output_host,    # host to upload the result file to
  String $task_name='mytask', # the task to run on each host
  Hash $task_parameters={},   # the parameters to pass to the task
  String $uploadfile='/tmp/uploaded.txt', # upload file path
) {

  $results = run_task($task_name, $targets, $task_parameters)

  $output = $results.map | $index, $value | {
    "Host: ${value.target.name}\n${value.message}\n======="
  }.join("\n")

  # using a built-in function
  # write_file($output, $uploadfile, $output_host)
  # using a task if the built-in function is not supported (older PE versions)
  run_task('bolt_primer::write_file', $output_host, {path=>$uploadfile, contents=>$output})
}
