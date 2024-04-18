#!/opt/puppetlabs/puppet/bin/ruby
require 'json'

params = JSON.parse($stdin.read)
message = params["message"]

# Rest of the code
puts "#{message} from Ruby version #{RUBY_VERSION}!"
