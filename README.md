useful links

http://marcgg.com/blog/2016/03/01/vimrc-example/
http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/

1. download menlo font http://www.cufonfonts.com/en/font/13494/menlo (included in High Sierra)

$ cd ~

$ git clone git@github.com:robinsk1/vim.git .vim

$ ln -s ~/.vim/vimrc ~/.vimrc

$ cd ~/.vim

$ git submodule init

$ git submodule update

========================

$ brew install macvim
$ brew install the_silver_searcher
