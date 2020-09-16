#!/usr/bin/env bash

# Verificar a distro Linux
# Red Hat (Fedora/CentOS)
# cat /etc/redhat-release
# Debian(confirmar) ou Ubuntu ou ElementaryOS
# cat /etc/issue

if [[ $(cat /etc/issue) == *"Debian"* ]]; then
  
  su -c "apt update" && su -c "apt install vim" && su -c "apt install yarn" && su -c "apt install dconf-cli"
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | su -c "apt-key add -"
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | su -c "tee /etc/apt/sources.list.d/yarn.list"

elif  [[ $(cat /etc/issue) == *"Ubuntu"* ]] || [[ $(cat /etc/issue) == *"elementary"* ]]; then

  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
  sudo -i apt update && sudo -i apt install vim && sudo -i apt install yarn && sudo -i apt install dconf-cli

else [[ $(cat /etc/redhat-release) == *"Fedora"* ]]

  curl --silent --location https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo
  curl --silent --location https://rpm.nodesource.com/setup_12.x | sudo bash -
  sudo -i dnf install vim && sudo -i dnf install yarn && sudo -i dnf install dconf*

fi

#Instala oh-my-bash (testar, provavelmente terá que ser instalado a parte)
if [[ $(cat /etc/issue) == *"Debian"* ]]; then
	su -c "$(curl -fsSL https://raw.github.com/ohmybash/oh-my-bash/master/tools/install.sh)"
else
	sh -c "$(curl -fsSL https://raw.github.com/ohmybash/oh-my-bash/master/tools/install.sh)"
fi

if [ -e $HOME/gnome-terminal ]; then
  echo " ~ Dracula Theme para Gnome Terminal já está instalado"
else
  cd $HOME
  git clone https://github.com/dracula/gnome-terminal
  cd gnome-terminal
  ./install.sh
  cd $HOME/dotfiles-linux
  echo " + Dracula Theme para Gnome Terminal Instalado com sucesso!"
fi

if [ -e $HOME/.vim/pack/themes/opt/dracula ]; then
  echo " ~ Dracula Theme para VIM já está instalado"
else
  mkdir -p ~/.vim/pack/themes/opt
  cd ~/.vim/pack/themes/opt
  git clone https://github.com/dracula/vim.git dracula
  cd $HOME/dotfiles-linux
  echo " + Dracula Theme para VIM instalado com sucesso!"
fi

# Instala Fonts para Powerline
if [ -e $HOME/fonts ]; then
  echo " ~ O Pacote de Fontes Nerd já está instalado"
else
  cd $HOME
  git clone https://github.com/powerline/fonts.git fonts
  cd fonts
  ./install.sh
  cd $HOME/dotfiles-linux
  echo " + Pacote de Fontes Nerd instalado com sucesso!"
fi

# Instala Font Droid Sans Mono Nerd to Linux fonts directory
font_dir="$HOME/.local/share/fonts"
cp "Droid Sans Mono Nerd Font Complete.otf" "$font_dir/"

# Copia os arquivos de configuração do VIM Vundle
if [ -e $HOME/.vim/bundle/Vundle.vim ]; then
  echo " ~ O VIM Vundle já está instalado"
else
  cd $HOME
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  cd -
  echo " + VIM Vundle instalado com sucesso!"
fi

if [ -e $HOME/.bashrc ]; then
  mv $HOME/.bashrc $HOME/.bashrc.old
  cp ./.bashrc $HOME/
  echo " + .bashrc substituido original renomeado para .bashrc.old"
fi

if [ -e $HOME/.vimrc ]; then
  mv $HOME/.vimrc $HOME/.vimrc.old
  cp ./.vimrc $HOME/
else
# echo "Não existe o arquivo .vimrc"
  cp ./.vimrc $HOME/
  echo " + .vimrc substituido original renomeado para .vimrc.old"
fi

echo " ################################################"
echo " # Instalação dos Dotfiles-linux finalizada !!! #"
echo " ################################################"

