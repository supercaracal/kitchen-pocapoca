require 'serverspec'
require 'pathname'
require 'net/ssh'
require 'yaml'

base_spec_dir = Pathname.new(File.join(File.dirname(__FILE__)))

Dir[base_spec_dir.join('shared/**/*.rb')].sort.each { |f| require f }

set :backend, :ssh
set :disable_sudo, true

properties = YAML.load_file(base_spec_dir.join('properties.yml'))

# if ENV['ASK_SUDO_PASSWORD']
#   begin
#     require 'highline/import'
#   rescue LoadError
#     raise 'highline is not available. Try installing it.'
#   end
#   set :sudo_password, ask('Enter sudo password: ') { |q| q.echo = false }
# else
#   set :sudo_password, ENV['SUDO_PASSWORD']
# end

# options = Net::SSH::Config.for(host)

options = properties[:savanna][:ssh]

set :host, options[:host_name]
set :ssh_options, options

set_property(properties[:savanna].reject { |k, _v| k == :ssh })
