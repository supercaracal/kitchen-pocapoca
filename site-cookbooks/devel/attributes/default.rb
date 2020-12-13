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
  libc++-dev
  openjdk-11-jdk
  gdb
  jq
  tree
  autoconf
  automake
  pkg-config
  libevent-dev
  flex
  bison
  zlib1g-dev
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
  .bash_local
  .bash_golang
  .bash_ndenv
  .bash_pyenv
  .bash_rbenv
]
default['user']['dotfiles'] = %w[
  .bash_local
  .Xresources
  .gemrc
  .gitconfig
  .inputrc
  .tmux.conf
  .vimrc
]
default['user']['workplace'] = 'vcs'
default['user']['dependency-repositories'] = %w[]

default['term']['color'] = 'gnome-256color'

default['git']['user']['name'] = 'Taishi Kasuga'
default['git']['user']['email'] = 'proxy0721@gmail.com'

default['ctags']['directories'] = %W[~/#{default['user']['workplace']}]
default['ctags']['file'] = '.tags'

default['pyenv']['version'] = '3.8.1'
default['pyenv']['pip'] = %w[cpplint]

default['rbenv']['version'] = '2.7.2'
default['rbenv']['gem'] = %w[]

default['ndenv']['version'] = 'v15.4.0'
default['ndenv']['npm'] = %w[]

default['golang']['version'] = '1.15.2'
default['golang']['packages'] = %w[golang.org/x/lint/golint]

default['docker']['compose']['version'] = '1.25.0'
