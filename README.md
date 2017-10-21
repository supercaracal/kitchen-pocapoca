# What's this?
My vm for the windows host.

## Installation

* [MSYS2](http://www.msys2.org/)
  * Add `C:\Ruby24-x64\bin` to PATH
  * Add `C:\msys64\usr\bin` to PATH
  * Add `C:\HashiCorp\Vagrant\bin` to PATH
  * Add `C:\opscode\chefdk\bin` to PATH
  * Add `C:\msys64\mingw64\bin` to PATH
  * Add `MSYS2_PATH_TYPE=inherit` to ENV
* [Git](https://git-for-windows.github.io/)
  * Add `%USERPROFILE%\AppData\Local\Programs\Git\cmd` to PATH
* [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
  * [Supported versions](https://www.vagrantup.com/docs/virtualbox/)
* [Ruby](https://rubyinstaller.org/)
* [Chef Development Kit](https://downloads.chef.io/chefdk)
* [Vagrant](https://www.vagrantup.com/downloads.html)

```
user@host$ pacman -S mingw-w64-x86_64-toolchain vim openssh
```

```
user@host$ vagrant plugin install vagrant-omnibus
user@host$ vagrant plugin install vagrant-share
user@host$ vagrant plugin install vagrant-disksize
```

```
user@host$ git clone git@github.com:supercaracal/kitchen-pocapoca.git
user@host$ cd kitchen-pocapoca
user@host$ berks vendor
user@host$ vagrant up
```

## Installation of vim plugins
```
user@guest$ vim
:call dein#install()
```

## Testing
```
user@host$ bundle install --path=.bundle
user@host$ bundle exec rake spec:savanna
```
