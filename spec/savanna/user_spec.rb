require 'spec_helper'

describe 'savanna::user' do
  include_examples 'home::init'
  include_examples 'home::ssh'
  include_examples 'home::bin'
  include_examples 'home::dotfile'
  include_examples 'home::workplace'
  include_examples 'home::vim'
  include_examples 'ruby::init'
  include_examples 'node::init'
end