# Syntastic Installation

## HTML

### w3c validator

Install the w3c validator from ubuntu sources:

```bash
sudo apt-get update
sudo apt-get install apache2 w3c-markup-validator libapache2-mod-perl2
```

Then fix the link with:

```bash
sudo ln -s /etc/w3c/httpd.conf /etc/apache2/conf-enabled/w3c-markup-validator.conf
```

Fix the permission on `/usr/lib/cgi-bin`
due to a problem in `/etc/apache2/conf-available/serve-cgi-bin.conf`. Copy the
following into the file:

```
<IfModule mod_alias.c>
    <IfModule mod_cgi.c>
        Define ENABLE_USR_LIB_CGI_BIN
    </IfModule>

    <IfModule mod_cgid.c>
        Define ENABLE_USR_LIB_CGI_BIN
    </IfModule>

    <IfModule mod_perl.c>
        Define ENABLE_USR_LIB_CGI_BIN
    </IfModule>

    <IfDefine ENABLE_USR_LIB_CGI_BIN>
        ScriptAlias /cgi-bin/ /usr/lib/cgi-bin/
        <Directory "/usr/lib/cgi-bin">
            AllowOverride None
            Options +ExecCGI -MultiViews +SymLinksIfOwnerMatch
            Require all granted
        </Directory>
    </IfDefine>
</IfModule>

# vim: syntax=apache ts=4 sw=4 sts=4 sr noet
```

Once done create a symlink to the validator's html directory `/var/www/html`:

```bash
sudo ln -s /usr/share/w3c-markup-validator/html /var/www/html/w3c-validator
```

Then restart the apache2 service:

```bash
sudo service apache2 restart
```

Check it's working on `localhost`:

```bash
http://localhost/w3c-validator
```

### HTML5 Validation

Follow the guide [github](https://github.com/tlvince/w3c-validator-guide) from
**"Optional"** section. The following notes should be taken into account:

* The java version may be different to the guide
* To include environment variables with a `sudo` command append the `-E` option

The validation should now work on
[http://localhost/w3c-validator](http://localhost/w3c-validator)
and the HTML5 validator on
[http://localhost:8888](http://localhost:8888)

## Css

The following dependencies are required:

```bash
sudo apt-get update
sudo apt-get install nodejs npm
```

Once nodejs is installed a symbolic link is needed to override the node command
already on the system.

```bash
sudo ln -s /usr/bin/nodejs /usr/bin/node
```

Now a simple npm install:

```bash
sudo npm install -g csslint
```

## Fortran

All that is required is either the intel fortran compilers or gfortran:

```bash
sudo apt-get update
sudo apt-get install gfortran
```

## C++ and C

All that is required is either the intel fortran compilers or gcc:

```bash
sudo apt-get update
sudo apt-get install gcc
```

## Python

All that is required is the `pylint` package:

```bash
sudo apt-get update
sudo apt-get install pylint
```

## Latex

All that is required is the `chktex` package:

```bash
sudo apt-get update
sudo apt-get install chktex
```

## Matlab

The `mlint` interpreter is found in the matlab install directory for the case
of the default install this is found in
`/usr/local/MATLAB/R2013a/bin/glnxa64`
this path needs to be exported in either `~/.zshrc` or `~/.bashrc` depending
on which shell is being used.

## Markdown

The `mdl` package requires the `gem` package manager to be installed:

```bash
sudo apt-get update
sudo apt-get gem
```

Then:

```bash
sudo gem install mdl
```