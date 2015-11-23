shared_examples 'database::postgresql' do |pkg_name: 'postgresql', port_num: 5432|
  describe package(pkg_name) do
    it { should be_installed }
  end

  describe port(port_num) do
    it { should be_listening }
  end
end
