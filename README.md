# gelofiles

## setup

> Arch Linux and Hyprland are expected to be already installed, running and connected to the internet

- install Yay

```bash
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
```

- install (almost) all the packages

```bash
yay -S aylurs-gtk-shell-git bat cmake docker docker-compose eza fastfetch firefox flatpak fzf gcc gopass hyprlock hyprpaper hyprshot jdk-openjdk kitty make maven mise nemo nvim obsidian spotify-launcher starship tomcat9 unzip waybar zsh
```

- install some development packages with `mise`

```bash
mise use -g node@latest
mise use -g lua@latest
```
