require 'spec_helper'

describe 'savanna::user' do
  include_examples 'home::init'
  include_examples 'home::ssh'
  include_examples 'home::bin'
  include_examples 'home::dotfile'
  include_examples 'home::workplace'
  include_examples 'home::vim'
  include_examples 'ruby::init', version: '2.4.2'
  include_examples 'node::init', version: 'v8.7.0'
  include_examples 'sudoers::savanna'
  include_examples 'golang::init', user_name: 'pocapoca'
end
