# kitchen-pocapoca
My development environment VM configurations. With bootstraping tool and configuration tool.

## features

* Added ssh user "pocapoca", only for me.
* Added random motd dot pictures, only for me.
* Added locally installation tools, only for me.
* Added tmux w/solarized color scheme, only for me.
* Added vim w/powerline via/dein, only for me.
* Added ctags creation via/cron, only for me.
* Added git w/vimdiff, only for me.
* Added clisp REPL, only for me.
* Added ruby via/rbenv w/some gems, only for me.
* Added node via/ndenv w/some npms, only for me.

## usage

### bootstraping and configuration

    user@host$ git clone git@github.com:supercaracal/kitchen-pocapoca.git
    user@host$ cd kitchen-pocapoca
    user@host$ berks vendor
    user@host$ vagrant up

### dein manual installation

    pocapoca@savanna:~$ vim
    :call dein#install()

### serverspec

    user@host$ bundle exec rake spec:savanna
