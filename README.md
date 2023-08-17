### setup env
```
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

$ sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

$ brew install asdf

$ echo -e "\n. \"$(brew --prefix asdf)/libexec/asdf.sh\"" >> ~/.zshrc
$ echo -e "\n. \"$(brew --prefix asdf)/etc/bash_completion.d/asdf.bash\"" >> ~/.zshrc

$ asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
$ asdf install nodejs latest
$ asdf global nodejs latest
$ asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
$ asdf install ruby latest
$ asdf global ruby latest
```
### setup vimrc

```
$ cd ~
$ git clone git@github.com:robinsk1/vim.git .vim
$ ln -s ~/.vim/vimrc ~/.vimrc

```
### setup macvim
```
$ brew install macvim
open macvim, run `:PlugInstall` 
$ gem install solargraph

install coc extensions as required

```
### useful links

http://marcgg.com/blog/2016/03/01/vimrc-example/
