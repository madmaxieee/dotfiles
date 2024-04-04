# madmaxieee's dotfiles

## Installation

1. install gnu stow and git

```bash
brew install stow git
```

2. clone the repo

```bash
cd ~
git clone https://github.com/madmaxieee/dotfiles.git
cd ~/dotfiles
```

3. sync submodules

```bash
git submodule update --init --recursive
```

4. install dotfiles

```bash
stow --target=$HOME --dir=$HOME/dotfiles --no-folding
```
