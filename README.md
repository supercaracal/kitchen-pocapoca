# kitchen-pocapoca
My development environment VM configurations. With bootstraping tool and configuration tool.

## home

    pocapoca@savanna:~$ ll
    合計 1200
    drwxr-xr-x  14 pocapoca pocapoca    4096 11月 24 10:50 ./
    drwxr-xr-x   5 root     root        4096 11月 22 17:25 ../
    -rw-r--r--   1 pocapoca pocapoca     561 11月 22 17:25 .Xresources
    -rw-------   1 pocapoca pocapoca   11356 11月 24 10:49 .bash_history
    -rw-r--r--   1 pocapoca pocapoca     220  4月  9  2014 .bash_logout
    -rw-r--r--   1 pocapoca pocapoca      77 11月 24 10:49 .bash_ndenv
    -rw-r--r--   1 pocapoca pocapoca      77 11月 24 10:49 .bash_rbenv
    -rw-r--r--   1 pocapoca pocapoca    3825 11月 22 17:25 .bashrc
    drwx------   4 pocapoca pocapoca    4096 11月 22 23:19 .cache/
    drwxr-xr-x   3 pocapoca pocapoca    4096 11月 22 22:30 .gem/
    -rw-r--r--   1 pocapoca pocapoca      23 11月 22 17:25 .gemrc
    -rw-r--r--   1 pocapoca pocapoca     249 11月 23 13:14 .gitconfig
    drwxrwxr-x   6 pocapoca pocapoca    4096 11月 24 10:20 .heroku/
    -rw-r--r--   1 pocapoca pocapoca      30 11月 22 17:25 .inputrc
    drwxr-xr-x   9 pocapoca pocapoca    4096 11月 22 22:33 .ndenv/
    -rw-------   1 pocapoca pocapoca     206 11月 22 17:42 .netrc
    drwxrwxr-x   3 pocapoca pocapoca    4096 11月 23 11:20 .node-gyp/
    drwxr-xr-x 234 pocapoca pocapoca   12288 11月 23 11:23 .npm/
    -rw-r--r--   1 pocapoca pocapoca     675  4月  9  2014 .profile
    -rw-------   1 pocapoca pocapoca       6 11月 22 23:08 .pry_history
    drwxr-xr-x  12 pocapoca pocapoca    4096 11月 22 22:30 .rbenv/
    -rw-rw-r--   1 pocapoca pocapoca      75 11月 24 03:04 .selected_editor
    drwx------   2 pocapoca pocapoca    4096 11月 24 10:49 .ssh/
    -rw-rw-r--   1 pocapoca pocapoca 1070029 11月 24 10:50 .tags
    -rw-r--r--   1 pocapoca pocapoca     489 11月 22 17:25 .tmux.conf
    drwx------   3 pocapoca pocapoca    4096 11月 24 03:47 .vim/
    -rw-------   1 pocapoca pocapoca   16729 11月 24 10:49 .viminfo
    -rw-r--r--   1 pocapoca pocapoca    2690 11月 22 22:08 .vimrc
    drwx------   2 pocapoca pocapoca    4096 11月 24 10:49 bin/
    drwxr-xr-x   5 pocapoca pocapoca    4096 11月 24 10:21 vcs/
    drwxrwxr-x   2 pocapoca pocapoca    4096 11月 24 10:21 vcs2/

## features

* Added ssh user "pocapoca", only for me.
* Added random motd dot pictures, only for me.
* Added locally installation tools, only for me.
* Added tmux w/solarized color scheme, only for me.
* Added vim w/powerline via/neobundle, only for me.
* Added ctags creation via/cron, only for me.
* Added git w/vimdiff, only for me.
* Added clisp REPL, only for me.
* Added ruby via/rbenv w/pry bundle rubocop guard rails, only for me.
* Added node via/ndenv w/grunt bower coffee-script, only for me.

## usage

### bootstraping with provisioning

    user@host$ git clone git@github.com:supercaracal/kitchen-pocapoca.git
    user@host$ cd kitchen-pocapoca
    user@host$ berks vendor
    user@host$ vagrant up
    user@host$ cp ~/.ssh/id_rsa ./
    user@host$ ssh pocapoca@127.0.0.1 -p 2222 -i /path/to/my_private_key

### authentication settings

    pocapoca@savanna:~$ mv /vagrant/id_rsa .ssh/
    pocapoca@savanna:~$ chmod 600 ~/.ssh/id_rsa
    pocapoca@savanna:~$ ssh-keygen -y -f ~/.ssh/id_rsa > ~/.ssh/id_rsa.pub
    pocapoca@savanna:~$ chmod 644 ~/.ssh/id_rsa.pub

### heroku settings

    pocapoca@savanna:~$ heroku login
    Enter your Heroku credentials.
    Email: 
    Password (typing will be hidden):
    Authentication successful.

    pocapoca@savanna:~$ heroku keys:add
    Found an SSH public key at /home/pocapoca/.ssh/id_rsa.pub
    Would you like to upload it to Heroku? [Yn] y
    Uploading SSH public key /home/pocapoca/.ssh/id_rsa.pub... done

### neobundle installation automatically

    pocapoca@savanna:~$ vim

### serverspec

Windows は純正のコマンドプロンプトから実行しましょう。何だかんだ言って CMD 最強です。あ、PowerShell でも可。

    user@host$ bundle exec rake spec:savanna

## back up by operation

Create postgresql user "insecure" for Rails applications.

### ssh vagrant user

    user@host$ vagrant ssh-config >> ~/.ssh/config
    user@host$ ssh default

### change password postgres user

    vagrant@savanna:~$ sudo -u postgres psql

    postgres=# ALTER USER postgres PASSWORD 'newPassword';
    ALTER ROLE

    postgres=# \q

### create insecure user

    vagrant@savanna:~$ createuser -U postgres -h localhost -W --echo --createdb --pwprompt insecure
    Enter password for new role: insecure
    Password:
    CREATE ROLE insecure PASSWORD 'md526d4949f81bc0573e4801d3a42165944' NOSUPERUSER CREATEDB NOCREATEROLE INHERIT LOGIN;

### check insecure user
    vagrant@savanna:~$ psql -U postgres -h localhost -W
    Password for user postgres:
    psql (9.3.6)
    SSL connection (cipher: DHE-RSA-AES256-SHA, bits: 256)
    Type "help" for help.

    postgres=# \du
                                 List of roles
     Role name |                   Attributes                   | Member of
    -----------+------------------------------------------------+-----------
     insecure  | Create DB                                      | {}
     postgres  | Superuser, Create role, Create DB, Replication | {}
    
    postgres=# \q
