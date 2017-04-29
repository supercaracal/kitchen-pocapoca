shared_examples 'tools::install' do
  %w[git tmux curl tree clisp].each do |pkg_name|
    describe package(pkg_name) do
      it { should be_installed }
    end
  end
end
