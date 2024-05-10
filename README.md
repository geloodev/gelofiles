# geloodev's dotfiles

## First Steps
- Update the entire system:
```sh
sudo pacman -Syu
```
- Install `yay`, it makes everything easier on Arch Linux:
```sh
sudo pacman -S yay
``` 
- Install all this other packages:
```sh
```

## Eww
- Follow the eww (https://elkowar.github.io/eww/eww.html)[installation guide] in the default folder `~`.
- Copy the `eww` executable to `/usr/bin`:
```sh
sudo cp ~/eww/target/release/eww /usr/bin/
```
- Execute this lines to see if the installation worked:
```sh
eww daemon
eww open windowname
```