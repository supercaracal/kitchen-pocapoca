require 'spec_helper'

describe 'savanna::global' do
  include_examples 'database::postgresql'
  include_examples 'locale::init'
  include_examples 'motd::dotpics'
  include_examples 'tools::install'
  include_examples 'golang::install'
  include_examples 'docker::install', compose_ver: '1.13.0'
end
