#Prerequisites:
#Ubuntu
#apt-get -y update
apt-get -y install libncurses5-dev libgnome2-dev libgnomeui-dev \
libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev ruby-dev mercurial cmake git
#(OSX) Command Line Tools for Xcode

VIM_TMP=/tmp/vim
VIM_INSTALL=/opt/vim
VIM_SETTINGS=/usr/local/etc/vim_settings

mkdir -p $VIM_TMP
mkdir -p $VIM_INSTALL
mkdir -p $VIM_SETTINGS/vim/bundle
mkdir -p $VIM_SETTINGS/vim/autoload
cp ./vimrc $VIM_SETTINGS/vimrc

hg clone https://vim.googlecode.com/hg $VIM_TMP
cd $VIM_TMP/src
./configure --enable-pythoninterp --with-features=huge --prefix=$VIM_INSTALL
make && make install


##On Ubuntu
apt-get -y install gtk2-engines-pixbuf





ln -s /opt/vim/bin/vim /usr/local/bin/vim
ln -s /usr/local/etc/vim_settings/vimrc $HOME/.vimrc
ln -s /usr/local/etc/vim_settings/vim   $HOME/.vim

git clone https://github.com/gmarik/vundle.git $VIM_SETTINGS/vim/bundle/vundle

vim +PluginInstall +qall

cd $HOME/.vim/bundle/YouCompleteMe
git submodule update --init --recursive
./install.sh --clang-completer
#rm -rf $VIM_TMP
