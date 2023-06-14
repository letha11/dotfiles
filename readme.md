# My Dotfile

## Application requirement to use this dotfiles
### Arch
```
$ yay/pacman -S base-devel brightnessctl ctags dunst exa figma-linux fvm-bin flameshot alacritty neovim nvm ntfs-3g perl nginx php php-fpm composer apache mariadb rar scrcpy stow syncthing rustup ripgrep tmux zsh 
```

After installing all the dependencies/applications you can run these command **MAKE SURE YOU DONT HAVE `.zshrc` IN YOUR HOME FOLDER**:

```bash
$ ./run.sh
```
you can open and see what are inside of the `run.sh` file, if you are lazy, it just create a link/symlink to your `~/.config/` folder and `~/.zshrc` with the help of `stow` package

#### Laptop
If you are using laptop you should install `tlp` package or [auto-cpufreq](https://github.com/AdnanHodzic/auto-cpufreq) for better battery life

#### PHP Development
I have an script that will start `nginx`, `mariadb`, and `php-fpm` from the systemctl, it placed in `scripts/run-lemp.sh`. if you want to use `apache` you can just run the command
```
$ sudo systemctl start httpd.service
```
because we already installed the `apache` package.

## NOTE
You need to install **NvChad** first in order to use the `nvim` configuration.
