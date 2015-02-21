define :source, user: 'root', home: '/tmp', files: [], destination: '.bashrc' do
  destination_file = "#{params[:home]}/#{params[:destination]}"

  params[:files].each do |file|
    bash "add source #{file} to #{destination_file}" do
      user params[:user]
      group params[:user]
      not_if "grep '#{file}' #{destination_file}"
      code <<-EOS
        touch #{destination_file}
        echo '' >> #{destination_file}
        echo '# added by configuration tools #{Time.now}' >> #{destination_file}
        echo 'source ~/#{file}' >> #{destination_file}
      EOS
    end
  end
end
