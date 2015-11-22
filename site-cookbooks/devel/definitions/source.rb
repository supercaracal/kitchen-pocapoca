define :source, user: 'root', files: [], destination: '/tmp/.bashrc', command: 'source' do
  params[:files].each do |file|
    bash "add source #{file} to #{params[:destination]}" do
      user params[:user]
      group params[:user]
      not_if "grep '#{file}' #{params[:destination]}"
      code <<-EOS
        touch #{params[:destination]}
        echo '' >> #{params[:destination]}
        echo '# added by configuration tools #{Time.zone.now}' >> #{params[:destination]}
        echo '#{params[:command]} "#{file}"' >> #{params[:destination]}
      EOS
    end
  end
end
