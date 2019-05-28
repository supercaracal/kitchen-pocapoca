default['apt']['packages'] = %w[
  build-essential
  curl
  exuberant-ctags
  git
  language-pack-ja
  libbz2-dev
  libffi-dev
  libmysqld-dev
  libncurses5-dev
  libncursesw5-dev
  libpq-dev
  libreadline-dev
  libsqlite3-dev
  libssl-dev
  make
  ncurses-term
  postgresql
  tmux
  wget
  xz-utils
  zlib1g-dev
  clang
  llvm
  openjdk-11-jdk
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
default['user']['bashrc']['sources'] = %w[
  .bash_golang
  .bash_ndenv
  .bash_pyenv
  .bash_rbenv
]
default['user']['dotfiles'] = %w[
  .Xresources
  .gemrc
  .gitconfig
  .inputrc
  .tmux.conf
  .vimrc
]
default['user']['workplace'] = 'vcs'
default['user']['dependency-repositories'] = %w[https://github.com/seebi/tmux-colors-solarized.git]

default['term']['color'] = 'xterm-256color'

default['git']['user']['name'] = 'Taishi Kasuga'
default['git']['user']['email'] = 'proxy0721@gmail.com'

default['ctags']['directories'] = %W[~/#{default['user']['workplace']}]
default['ctags']['file'] = '.tags'

default['pyenv']['version'] = '3.7.2'
default['pyenv']['pip'] = %w[cpplint]

default['rbenv']['version'] = '2.6.2'
default['rbenv']['gem'] = %w[
  bundler
  pry
  rails
  rb-readline
  rubocop
  rubocop-rspec
  scss_lint
  slim_lint
]

default['ndenv']['version'] = 'v10.15.3'
default['ndenv']['npm'] = %w[
  bower
  coffee-script
  david
  eslint
  eslint-config-airbnb-base
  eslint-plugin-import
  grunt-cli
  jshint
]

default['golang']['version'] = '1.12.1'
default['golang']['packages'] = %w[
  golang.org/x/lint/golint
  github.com/k0kubun/pp
  github.com/motemen/gore
  github.com/nsf/gocode
  golang.org/x/tools/cmd/...
]

default['docker']['compose']['version'] = '1.23.2'
