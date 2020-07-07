plan bolt_primer::aggregate_outputs (
  TargetSpec $targets,        # hosts to run the task on 
  TargetSpec $output_host,    # host to upload the result file to
  String $task_name='mytask', # the task to run on each host
  Hash $task_parameters={},   # the parameters to pass to the task
  String $tempfile='/tmp/output.txt',     # local temp file path
  String $uploadfile='/tmp/uploaded.txt', # upload file path
) {

  $results = run_task($task_name, $targets, $task_parameters)

  $output = $results.map | $index, $value | {
    "Host: ${value.target.name}\n${value.message}\n======="
  }

  file::write($tempfile, $output.join("\n"))
  upload_file($tempfile, $uploadfile, $output_host)
}
