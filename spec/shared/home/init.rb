shared_examples 'home::init' do |user_name: 'pocapoca', user_group: 'pocapoca', home_dir: '/home/pocapoca'|
  describe user(user_name) do
    it { should exist }
    it { should belong_to_group(user_group) }
    it { should have_home_directory(home_dir) }
    it { should have_login_shell('/bin/bash') }
    it { should have_authorized_key('ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDAzR5By3B8DrQNoVpZdXLAsw24igEcYAfqYO46iko7oOkV1DDR5OVt7R8DlJB37rcy3TVmkGEEVNxdrZc1quE9A8CWpokz8TnAY9qYMreWm6LrcYxr6eZd1AHkwYZMixjpHLzmoBu/D/Lu3JFMkWau6Iwv3g2s9ZgpyYsl773Ay9bSEK5C1YKKLlLFC4SC8V5FVIlkdb902BoiCiB/z34NZFs0ric7DUoMn4vLDWj1MikT4vAzsBvC12TgXS79adj8aAcK6PxLSzaCtDmEwtFXNBKUb6xyH2lKzuWoXlZjRik7ExNK8E8umDJ5IZfnBNidB4YoezNKeyQJrO9k2QpF KIRA@KILLERQUEEN') }
    it { should have_authorized_key('ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIEAog2qnZV56eZ8snLnGba4FD8dLRbVyaQS68mA2zWcXP1PKs2lw2Xj1NKg4nbpjuC6D+tWw9+jM5Rc+fqgp3zhA8B5kOqQSDD7PwRYbH6XJJQ3dSqnSc2gPN90eQqIahQO3mQc4JIcJWRjITe3HMSH7gQzNCuQuxccTj2ZUFvwKfc= kasuga@NPC-0284') }
  end

  # describe command('/bin/echo $TERM') do
  #   its(:stdout) { should match(/xterm-256color/) }
  # end
end
