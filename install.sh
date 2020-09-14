#!/usr/bin/env bash

# Verificar a distro Linux
# Red Hat (Fedora/CentOS)
# cat /etc/redhat-release
# Debian(confirmar) ou Ubuntu ou ElementaryOS
# cat /etc/issue

if [[ $(cat /etc/issue) == *"Ubuntu"* ]]; then
#  echo "Contém Ubuntu"
  sudo -i apt install git && sudo -i apt install vim && sudo -i apt install yarn && sudo -i apt install dconf-cli
elif [[ $(cat /etc/issue) == *"elementary"* ]]; then
#  echo "Contém ElementaryOS"
  sudo -i apt install git && sudo -i apt install vim && sudo -i apt install yarn && sudo -i apt install dconf-cli
elif [[ $(cat /etc/issue) == *"Debian"* ]]; then
#  echo "Contém Debian"
  sudo -i apt install git && sudo -i apt install vim && sudo -i apt install yarn && sudo -i apt install dconf-cli
else [[ $(cat /etc/redhat-release) == *"Fedora"* ]]
#  echo "Contém Fedora"
  sudo -i dnf install git && sudo -i dnf install vim && sudo -i dnf install yarn && sudo -i dnf install dconf*
fi

#Instala oh-my-bash (testar, provavelmente terá que ser instalado a parte)
#sh -c "$(curl -fsSL https://raw.github.com/ohmybash/oh-my-bash/master/tools/install.sh)"

if [ -e $HOME/gnome-terminal ]; then
  echo " ~ Dracula Theme para Gnome Terminal já está instalado"
else
  cd $HOME
  git clone https://github.com/dracula/gnome-terminal
  cd gnome-terminal
  ./install.sh
  cd $HOME/dotfiles-linux
fi

if [ -e ]; then
  echo " ~ Dracula Theme para VIM já está instalado"
else
  mkdir ~/.vim/pack/themes/opt
  cd ~/.vim/pack/themes/opt
  git clone https://github.com/dracula/vim.git dracula
  cd $HOME/dotfiles-linux
fi

# Instala Fonts para Powerline
if [ -e $HOME/fonts ]; then
  echo " ~ O Pacote de Fontes já está instalado"
else
  cd $HOME
  git clone https://github.com/powerline/fonts.git fonts
  cd fonts
  ./install.sh
  cd $HOME/dotfiles-linux
fi

# Instala Font Droid Sans Mono Nerd to Linux fonts directory
font_dir="$HOME/.local/share/fonts"
cp "Droid Sans Mono Nerd Font Complete.otf" "$font_dir/"

# Copia os arquivos de configuração do VIM Vundle
if [ -e $HOME/.vim/bundle/Vundle.vim ]; then
  echo " ~ O Vundle já está instalado"
else
  cd $HOME
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  cd -
fi

# Instala o NodeJS
if [[ $(node --version) == *"v12"* ]]; then
  echo " ~ O NodeJS já está instalado"
else
  echo " !! Por favor instale o NodeJS como root com o comando 'curl -sL install-node.now.sh/lts | bash'"
  echo " + Fim da instalação do NodeJS"
fi

if [ -e $HOME/.bashrc ]; then
  echo " + Backup do .bashrc feito e arquivo substituido"
  mv $HOME/.bashrc $HOME/.bashrc.old
  cp ./.bashrc $HOME/
fi

if [ -e $HOME/.vimrc ]; then
  echo " + Backup do .vimrc feito e arquivo substituido"
  mv $HOME/.vimrc $HOME/.vimrc.old
  cp ./.vimrc $HOME/
else
# echo "Não existe o arquivo .vimrc"
  cp ./.vimrc $HOME/
fi

echo " ############################################"
echo " # Dotfiles-linux instalado com sucesso !!! #"
echo " ############################################"

