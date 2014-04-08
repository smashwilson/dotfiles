# pry utilities for Fog.

require 'yaml'

def fog_credentials named = :personal
  path = File.join ENV['HOME'], '.fog-credentials.yml'
  YAML.load_file(path)[named.to_s] || begin
    raise "I don't know an account called: #{named}"
    nil
  end
end

def log_me_in service_kind, **options
  require 'fog'

  creds = fog_credentials(options.delete(:account) || :personal)
  puts "[fog] logging in as #{creds['username']}."
  opts = {
    provider: :rackspace,
    rackspace_username: creds['username'],
    rackspace_api_key: creds['apiKey'],
    rackspace_region: options[:region] || :ord
  }.merge!(options)
  service_kind.new(opts)
end
