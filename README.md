# kitchen-pocapoca
My development environment VM configurations. With bootstraping tool and configuration tool.

## home

    pocapoca@savanna:~$ ll
    合計 3604
    drwxr-xr-x  12 pocapoca pocapoca    4096  2月 28 20:25 ./
    drwxr-xr-x   5 root     root        4096  2月 28 16:30 ../
    -rw-------   1 pocapoca pocapoca    1934  2月 28 20:22 .bash_history
    -rw-r--r--   1 pocapoca pocapoca     220  4月  9  2014 .bash_logout
    -rw-r--r--   1 pocapoca pocapoca      77  2月 28 20:23 .bash_ndenv
    -rw-r--r--   1 pocapoca pocapoca      77  2月 28 20:23 .bash_rbenv
    -rw-r--r--   1 pocapoca pocapoca    3825  2月 28 18:46 .bashrc
    drwx------   4 pocapoca pocapoca    4096  2月 28 18:51 .cache/
    drwxr-xr-x   3 pocapoca pocapoca    4096  2月 28 16:39 .gem/
    -rw-r--r--   1 pocapoca pocapoca     227  2月 28 16:30 .gitconfig
    -rw-r--r--   1 pocapoca pocapoca      30  2月 28 16:30 .inputrc
    drwxr-xr-x   9 pocapoca pocapoca    4096  2月 28 16:41 .ndenv/
    drwxrwxr-x   3 pocapoca pocapoca    4096  2月 28 19:28 .node-gyp/
    drwxr-xr-x 239 pocapoca pocapoca   12288  2月 28 19:28 .npm/
    -rw-r--r--   1 pocapoca pocapoca     675  4月  9  2014 .profile
    -rw-------   1 pocapoca pocapoca     871  2月 28 18:59 .pry_history
    drwxr-xr-x  12 pocapoca pocapoca    4096  2月 28 16:39 .rbenv/
    drwx------   2 pocapoca pocapoca    4096  2月 28 20:22 .ssh/
    -rw-rw-r--   1 pocapoca pocapoca 3578449  2月 28 20:25 .tags
    -rw-r--r--   1 pocapoca pocapoca     599  2月 28 20:23 .tmux.conf
    drwx------   3 pocapoca pocapoca    4096  2月 28 16:31 .vim/
    -rw-------   1 pocapoca pocapoca    6328  2月 28 20:25 .viminfo
    -rw-r--r--   1 pocapoca pocapoca    2453  2月 28 20:22 .vimrc
    drwx------   2 pocapoca pocapoca    4096  2月 28 16:30 bin/
    drwxr-xr-x   5 pocapoca pocapoca    4096  2月 28 19:29 vcs/

## features

* ssh user 'pocapoca'
* random motd dot pictures
* locally installation tools
* tmux w/solarized color scheme
* vim w/neobundle,powerline
* ctags creation w/cron
* git w/vimdiff
* clisp REPL
* ruby w/pry,bundle,rubocop
* node w/grunt,bower,coffee-script

## back up by operation

Create postgresql user "insecure" for Rails applications.

    user@host$ vagrant ssh-config >> ~/.ssh/config
    user@host$ ssh default

    vagrant@guest$ sudo -u postgres psql

    postgres=# ALTER USER postgres PASSWORD 'newPassword';
    ALTER ROLE

    postgres=# \q

    vagrant@guest$ createuser -U postgres -h localhost -W --echo --createdb --pwprompt insecure
    Enter password for new role:
    Password:
    CREATE ROLE insecure PASSWORD 'md526d4949f81bc0573e4801d3a42165944' NOSUPERUSER CREATEDB NOCREATEROLE INHERIT LOGIN;

    vagrant@guest$ psql -U postgres -h localhost -W
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
    
    postgres=#
