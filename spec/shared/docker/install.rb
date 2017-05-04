shared_examples 'docker::install' do |compose_ver: '1.13.0'|
  describe command('/usr/bin/docker ps') do
    its(:stdout) { should contain('CONTAINER ID') }
  end

  describe command('/usr/local/bin/docker-compose --version') do
    its(:stdout) { should contain(compose_ver) }
  end
end
