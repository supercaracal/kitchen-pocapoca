# What's this?
My vm for the windows host.

# Installation
## Dependencies
* [MSYS2](http://www.msys2.org/)
* [Git](https://git-for-windows.github.io/)
* [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
  * [Supported versions](https://www.vagrantup.com/docs/virtualbox/)
* [Ruby](https://rubyinstaller.org/)
* [Chef Development Kit](https://downloads.chef.io/chefdk)
* [Vagrant](https://www.vagrantup.com/downloads.html)
* [RictyDiminished](https://github.com/edihbrandon/RictyDiminished)

## Env vars
* Add `C:\Ruby24-x64\bin` to PATH
* Add `C:\msys64\usr\bin` to PATH
* Add `C:\HashiCorp\Vagrant\bin` to PATH
* Add `C:\opscode\chefdk\bin` to PATH
* Add `C:\msys64\mingw64\bin` to PATH
* Add `%USERPROFILE%\AppData\Local\Programs\Git\cmd` to PATH
* Add `MSYS2_PATH_TYPE=inherit` to ENV
* Add `C:/Users /home` to `/etc/fstab`

## .minttyrc
```
BoldAsFont=no
Transparency=medium
Font=Ricty Diminished
FontHeight=12
CopyAsRTF=no
Columns=130
Rows=40
Term=xterm-256color
BackspaceSendsBS=yes
Locale=ja_JP
Charset=UTF-8
CursorType=block
```

## .vimrc
```vim
syntax enable

colorscheme elflord

set fileencodings=ucs-bom,utf-8,cp932,euc-jp,latin1,default
set backspace=indent,eol,start

set cmdheight=2
set laststatus=2
set showcmd

set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
highlight StatusLine ctermfg=black ctermbg=white

set nowrap
set nobackup
set noswapfile

set autoindent
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2

set number
set list
set lcs=tab:^^,eol:~

set hlsearch
set incsearch
set ignorecase
set wildignorecase
```

## .tmux.conf
```sh
set -g prefix C-q
unbind C-b

set -g default-terminal "xterm-256color"
set -g history-limit 10000

set -ag terminal-overrides ',*:U8=0'
set -ag terminal-overrides ',*:Cr=\E]12;white\007'

set -g base-index 1
set -g pane-base-index 1

set -g status on
set -g status-interval 5
set -g status-justify "centre"
set -g status-left-length 40
set -g status-right-length 40
set -g status-left '#H[#S] #[default]'
set -g status-right '%Y-%m-%d(%a) %H:%M #[default]'
set -g status-fg white
set -g status-bg black

set-window-option -g mode-keys vi
set-window-option -g aggressive-resize
set-window-option -g status-position top
```

## .profile
```sh
alias ls='ls --color=auto --show-control-chars'
alias ll='ls -la --color=auto --show-control-chars'
alias l='ls -CF --color=auto --show-control-chars'

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi

  if [ -d "$HOME/vcs/git" ]; then
    . ~/vcs/git/contrib/completion/git-prompt.sh
    . ~/vcs/git/contrib/completion/git-completion.bash
    export PS1='\[\e]0;\w\a\]\[\e[32m\]\u@\h\[\e[0m\]:\[\e[33m\]\w\[\e[0m\]\[\e[35m\]$(__git_ps1)\[\e[0m\]\$ '
  else
    export PS1='\[\e]0;\w\a\]\[\e[32m\]\u@\h\[\e[0m\]:\[\e[33m\]\w\[\e[0m\]\$ '
  fi
fi
```

## Pacman
```
user@host$ pacman -S mingw-w64-x86_64-toolchain
user@host$ pacman -S openssh
user@host$ pacman -S vim
user@host$ pacman -S tmux
user@host$ pacman -S bash-completion
```

## Vagrant plugins
```
user@host$ vagrant plugin install vagrant-omnibus
user@host$ vagrant plugin install vagrant-share
user@host$ vagrant plugin install vagrant-vbguest
```

## Start-up VM
```
user@host$ git clone git@github.com:supercaracal/kitchen-pocapoca.git
user@host$ cd kitchen-pocapoca
user@host$ berks vendor
user@host$ vagrant up
```

## Vim plugins
```
user@guest$ vim
:call dein#install()
```

# Testing
```
user@host$ bundle install --path=.bundle
user@host$ bundle exec rake spec:savanna
```

# Disk Expansion (10GB -> 20GB)
```
# C:\Users\{USER}\VirtualBox VMs\kitchen-pocapoca_default_1553137795531_95021
# C:\Program Files\Oracle\VirtualBox\VBoxManage.exe

$ VBoxManage clonemedium disk ubuntu-bionic-18.04-cloudimg.vmdk ubuntu-bionic-18.04-cloudimg.vdi --format VDI
$ VBoxManage modifyhd ubuntu-bionic-18.04-cloudimg.vdi --resize 20480
$ VBoxManage clonemedium disk ubuntu-bionic-18.04-cloudimg.vdi ubuntu-bionic-18.04-cloudimg-expanded.vmdk --format VMDK

# Modify SCSI(0,0) by using Oracle VirtualBox GUI

$ VBoxManage closemedium ubuntu-bionic-18.04-cloudimg.vdi
$ VBoxManage closemedium ubuntu-bionic-18.04-cloudimg.vmdk
```
