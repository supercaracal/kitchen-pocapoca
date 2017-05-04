# kitchen-pocapoca
My development environment VM configurations.

## Features

* Random motd dot pictures
* User pocapoca
* Vim, Tmux
* Docker
* PostgreSQL
* Ruby
* Node
* Golang

## Usage

### Tools installation

* Ruby
* VirtualBox
* Vagrant
* Chef Development Kit

### Bootstraping and Configuration

    user@host$ git clone git@github.com:supercaracal/kitchen-pocapoca.git
    user@host$ cd kitchen-pocapoca
    user@host$ berks vendor
    user@host$ vagrant up

### Dein Manual Installation

    pocapoca@savanna:~$ vim
    :call dein#install()

### Serverspec

    user@host$ bundle install --path=.bundle
    user@host$ bundle exec rake spec:savanna
