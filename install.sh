#!/usr/bin/env bash

# Verificar a distro Linux
# Red Hat (Fedora/CentOS)
# cat /etc/redhat-release
# Debian(confirmar)/Ubuntu ou ElementaryOS
# cat /etc/issue

if [[ $(cat /etc/issue) == *"Ubuntu"* ]]; then
  echo "Contém Ubuntu"
elif [[ $(cat /etc/issue) == *"elementary"* ]]; then
  echo "Contém ElementaryOS"
elif [[ $(cat /etc/redhat-release) == *"Fedora"* ]]; then
  echo "Contém Fedora"
fi

#Instala oh-my-bash
#sh -c "$(curl -fsSL https://raw.github.com/ohmybash/oh-my-bash/master/tools/install.sh)"

# Instala Fonts para Powerline
#git clone https://github.com/powerline/fonts.git fonts
#cd fonts
#./install.sh

# Instala Font Droid Sans Mono Nerd to Linux fonts directory
#font_dir="$HOME/.local/share/fonts"
#cp "Droid Sans Mono Nerd Font Complete.otf" "$font_dir/"

# Copia os arquivos de configuração do VIM Vundle
#git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Instala o NodeJS como root
# Testar `su root -c + o curl....`
#sudo su - &
#curl -sL install-node.now.sh/lts | bash
#echo "Fim da instalação do NodeJS"
#id

# TODO
# Automatizar todo processo de instalação das dependências ainda não cobertos nesse script
