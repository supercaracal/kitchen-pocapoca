default['apt']['packages'] = %w(
  ncurses-term
  exuberant-ctags
  language-pack-ja
  git
  tmux
  curl
  tree
  clisp
)

default['global']['lang'] = 'LANG=ja_JP.UTF-8'
default['global']['locale'] = 'Japan'

default['user']['shell'] = '/bin/bash'
default['user']['commands'] = %w(gitvimdiff create_ctags)
default['user']['bashrc']['sources'] = %w(.bash_rbenv)
default['user']['dotfiles'] = %w(.inputrc .vimrc .tmux.conf .gitconfig)
default['user']['workplace'] = 'vcs'

default['term']['color'] = 'xterm-256color'

default['git']['user']['name'] = 'supercaracal'
default['git']['user']['email'] = 'supercaracal@yahoo.co.jp'

default['ctags']['directories'] = %W(~/#{default['user']['workplace']})
default['ctags']['file'] = '.tags'

default['rbenv']['version'] = '2.2.0'
default['rbenv']['gems'] = %w(bundle rubocop rb-readline pry)
