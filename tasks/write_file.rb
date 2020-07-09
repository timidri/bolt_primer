#!/opt/puppetlabs/puppet/bin/ruby
require 'json'

params = JSON.parse(STDIN.read)
path = params['path']
contents = params['contents']

File.write(path, contents)
