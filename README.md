# kitchen-pocapoca
My development environment VM configurations.

## features

* Random motd dot pictures
* User pocapoca
* Vim, Tmux
* PostgreSQL
* Ruby
* Node
* Golang

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
