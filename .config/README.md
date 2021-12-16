# Instalação do i3wm

## !!! Pré-requisito !!!

* Instalar Debian 11 (minimal)

### Configurações

```sh
# login on root or:
su -
apt install sudo
usermod -aG sudo van
sudo apt install -y build-essential curl git
systemctl reboot
```

```sh
git clone https://github.com/souovan/dotfiles-linux.git && \
cd ~/dotfiles-linux/.config/ && \
./install-i3-rofi-polybar.sh
```

```sh
cd ~/dotfiles-linux && \
xdg-user-dirs-update && \
cp -Rv .config/* ~/.config/ && \
cp -Rv .local/* ~/.local/ && \
mkdir -p ~/bin && \
cp -Rv bin/* ~/bin/ && \
cp -Rv .config/i3/wallpaper/* ~/Downloads && \
systemctl reboot
```

# Change rofi theme

```sh
rofi-theme-selector
# select theme dracula hit 
Enter
# hit 
Alt+a
```

#### Instalar aplicativos e utilitários

```sh
su -c "xargs -a i3wm_apps_utils.txt apt-get install -y"
systemctl reboot
```