plan bolt_primer::pdb_query (
  String $query,
  Enum[json,csv] $format = json,
) {
  $results = puppetdb_query($query)

  case $format {
    'json': { out::message(to_json_pretty($results)) }
    'csv': {
      # first collect all the keys for the header line
      $keys = $results.reduce([]) | $keys, $r | { $keys + $r.keys }.unique
      # generate csv header line
      out::message($keys.map | $k | { "\"${k}\"" }.join(','))
      # generate data lines
      $results.each | $r | {
        $line = $r.map | $k, $v | { "\"${v}\"" }
        out::message($line.join(','))
      }
    }
    default: { fail_plan("invalid format: ${format}") }
  }
}
