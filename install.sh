#!/usr/bin/env bash

# Verificar a distro Linux
# Red Hat (Fedora/CentOS)
# cat /etc/redhat-release
# Debian ou Ubuntu ou ElementaryOS
# cat /etc/issue

if [[ $(cat /etc/issue) == *"Debian"* ]]; then

  su -c "curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -"
  su -c 'echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list'
  su -c "apt update && apt install vim -y && apt install yarn -y  && apt install dconf-cli -y"

# Instala NodeJS (testar e inserir ubuntu, elementaryos)
su -c "curl -sL install-node.now.sh/lts | bash"

elif  [[ $(cat /etc/issue) == *"Ubuntu"* ]]; then

  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
  sudo -i apt update && sudo -i apt install vim -y && sudo -i apt install yarn -y && sudo -i apt install dconf-cli -y

elif [[ $(cat /etc/issue) == *"elementary"* ]]; then

  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
  sudo -i apt update && sudo -i apt install vim -y && sudo -i apt install yarn -y  && sudo -i apt install dconf-cli -y
  sudo -i curl -sL install-node.now.sh/lts | sudo -i bash

if [[ $(cat /etc/issue) == *"elementary OS Hera"* ]]; then
# Handmade Dracula Theme for Olds ElementaryOS Console
  gsettings set io.elementary.terminal.settings font "Fira Mono for Powerline Regular"
  
  gsettings set io.elementary.terminal.settings palette "#262626:#E356A7:#42E66C:#E4F34A:#9B6BDF:#E64747:#75D7EC:#EFA554:#7A7A7A:#FF79C6:#50FA7B:#F1FA8C:#BD93F9:#FF5555:#8BE9FD:#FFB86C"
  gsettings set io.elementary.terminal.settings foreground "#F8F8F2"
  gsettings set io.elementary.terminal.settings background "rgba(40, 42, 54, .95)"
  gsettings set io.elementary.terminal.settings cursor-color "#6E46A4"
  gsettings set io.elementary.terminal.settings follow-last-tab "true"

else
# Handmade Dracula Theme for ElementaryOS Hera
  gsettings set org.pantheon.terminal.settings font "Fira Mono for Powerline Regular"
  
  gsettings set org.pantheon.terminal.settings palette "#262626:#E356A7:#42E66C:#E4F34A:#9B6BDF:#E64747:#75D7EC:#EFA554:#7A7A7A:#FF79C6:#5OFA7B:#F1FA8C:#BD93F9:#FF5555:#8BE9FD:#FFB86C"
  gsettings set org.pantheon.terminal.settings foreground "#F8F8F2"
  gsettings set org.pantheon.terminal.settings background "rgba(40, 42, 54, .95)"
  gsettings set org.pantheon.terminal.settings cursor-color "#6E46A4"
  gsettings set org.pantheon.terminal.settings follow-last-tab "true"
fi

else [[ $(cat /etc/redhat-release) == *"Fedora"* ]]

  curl --silent --location https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo
  curl --silent --location https://rpm.nodesource.com/setup_12.x | sudo bash -
  sudo -i dnf install vim -y && sudo -i dnf install yarn -y  && sudo -i dnf install dconf* -y
  sudo -i curl -sL install-node.now.sh/lts | sudo -i bash

fi

#Instala oh-my-bash (testar, provavelmente terá que ser instalado a parte)
sh -c "$(curl -fsSL https://raw.github.com/ohmybash/oh-my-bash/master/tools/install.sh)" &
#echo " Pressione ENTER para continuar a instalação..."

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
else
  cp ./.bashrc $HOME/
  echo " + .bashrc substituido, original renomeado para .bashrc.old"
fi

if [ -e $HOME/.vimrc ]; then
  mv $HOME/.vimrc $HOME/.vimrc.old
  cp ./.vimrc $HOME/
else
  cp ./.vimrc $HOME/
  echo " + .vimrc substituido, original renomeado para .vimrc.old"
fi

echo " ################################################"
echo " # Instalação dos Dotfiles-linux finalizada !!! #"
echo " ################################################"

