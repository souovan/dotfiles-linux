# Meus dotfiles linux

### Compatível com as distros:
* Ubuntu
* Elementary
* Fedora
* RHEL8

## INSTALAÇÃO (QUASE)AUTOMÁTICA DAS DEPENDÊNCIAS

* Instale o `curl`
* Instale o `git`

Debian:
```bash
su - 
usermod -aG sudo <your_user>
apt install -y curl git
reboot
```

Ubuntu:
```bash
sudo apt install -y curl git
```

RHEL:
```bash
su -c "dnf install -y curl git"
```

* Instale os dotfiles:

  ```bash
  curl -L https://souovan.github.io/install.sh
  ```
**REINICIE O TERMINAL**

* Abra o VIM e execute o comando `:PluginInstall`

---

## INSTALAÇÃO MANUAL DAS DEPENDÊNCIAS

* Clonar este repositório
* Instalar o `curl`
* Instalar o `git`
* Instalar o `vim`
* Instalar Oh-My-Bash `sh -c "$(curl -fsSL https://raw.github.com/ohmybash/oh-my-bash/master/tools/install.sh)"`
* Instalar [Dracula theme for gnome terminal](https://draculatheme.com/gnome-terminal/)
  * Instalar `dconf-cli` no Fedora: `sudo dnf install dconf*`
* Instalar [Dracula theme for VIM](https://draculatheme.com/vim/)
* Instalar Font for powerline:
 ```
 git clone https://github.com/powerline/fonts.git fonts
 cd fonts
 install.sh
 ```
* Instalar a Font `Droid Sans Mono Nerd`
* Clonar os arquivos de configuração do VIM Vundle `git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
* Install Dracula Vim theme
```bash
mkdir -p ~/.vim/pack/themes/opt
cd ~/.vim/pack/themes/opt
git clone https://github.com/dracula/vim.git dracula &> /dev/null
```
* Copiar `.bashrc` e `.vimrc` para a pasta $HOME `~/` renomeando os arquivos originais ex.: `.bashrc.old`
* No VIM executar o comando `:PluginInstall`

# SCREENSHOTS

![](./imgs/ll-gitstatus.png)

![](./imgs/gitadd.png)

![](./imgs/vim-python-nerdtree.png)

![](./imgs/vim-readme-nerdtree.png)
