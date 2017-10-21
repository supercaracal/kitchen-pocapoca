default['apt']['packages'] = %w[
  libffi-dev
  zlib1g-dev
  libssl-dev
  ncurses-term
  exuberant-ctags
  language-pack-ja
  libpq-dev
  postgresql
  libmysqld-dev
  libsqlite3-dev
  libreadline-dev
  git
  tmux
  curl
  tree
  clisp
  jq
]

default['global']['lang'] = 'LANG=ja_JP.UTF-8'
default['global']['locale'] = 'Japan'
default['global']['motd']['sctipt'] = '99-dotpics'
default['global']['motd']['dir'] = '/etc/motds'
default['global']['motd']['files'] = %w[
  motd_airman
  motd_bubble_slime
  motd_docker
  motd_dq2_allstar
  motd_hagure_metal
  motd_slime_allstar
]

default['global']['postgresql']['version'] = '9.6'

default['user']['shell'] = '/bin/bash'
default['user']['commands'] = %w[gitvimdiff create_ctags]
default['user']['bashrc']['sources'] = %w[.bash_rbenv .bash_ndenv .bash_golang]
default['user']['dotfiles'] = %w[.inputrc .vimrc .tmux.conf .gitconfig .Xresources .gemrc]
default['user']['workplace'] = 'vcs'
default['user']['dependency-repositories'] = %w[https://github.com/seebi/tmux-colors-solarized.git]

default['term']['color'] = 'xterm-256color'

default['git']['user']['name'] = 'Taishi Kasuga'
default['git']['user']['email'] = 'proxy0721@gmail.com'

default['ctags']['directories'] = %W[~/#{default['user']['workplace']}]
default['ctags']['file'] = '.tags'

default['rbenv']['version'] = '2.4.2'
default['rbenv']['gems'] = %w[bundler rubocop rubocop-rspec rb-readline pry rails scss_lint]

default['ndenv']['version'] = 'v8.7.0'
default['ndenv']['npms'] = %w[bower coffee-script grunt-cli jshint david eslint-config-airbnb-base eslint eslint-plugin-import]

default['golang']['version'] = '1.9.1'
default['golang']['packages'] = %w[github.com/motemen/gore github.com/nsf/gocode github.com/k0kubun/pp github.com/golang/lint/golint golang.org/x/tools/cmd/...]

default['docker']['compose']['version'] = '1.16.1'
