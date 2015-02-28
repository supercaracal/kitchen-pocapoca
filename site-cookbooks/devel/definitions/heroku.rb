define :heroku do
  if platform?('ubuntu')
    bash 'heroku toolbelt' do
      user 'root'
      group 'root'
      not_if 'which heroku'
      code <<-EOS
        wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh
      EOS
    end
  else
    log 'heroku toolbelt' do
      level :info
      message 'Heroku toolbelt supports Debian/Ubuntu.'
    end
  end
end
