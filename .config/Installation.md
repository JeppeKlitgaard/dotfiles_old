# Installation (Jeppe Dotfiles)

This contains instruction on how to install my dotfiles.
This is targeted at a Ubuntu-based system.

## fzf

```sh
sudo apt install fzf batcat fd-find
ln -s $(which fdfind) ~/.local/bin/fd
# Note fzf may not be very up-to-date, consider installing from https://github.com/junegunn/fzf
```

## Zoxide

```sh
curl --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/ajeetdsouza/zoxide/master/install.sh | sh
