# My Personal NeoVim Configuration

Very simple configuration of NeoVim using built-in package manager. I use Copilot as a completion engine without any LSPs. Goal is to have a very clean and editing focused environment.

## Installation

Before you start, make sure that you have installed NeoVim and Git on your system. Then, backup your current configuration if you have any:

```bash
mv ~/.config/nvim ~/.config/nvim.bak
```

Then, clone this repository to your `~/.config` directory:

```bash
git clone https://github.com/nizamiza/nvim.git ~/.config/nvim
```

## Installing Plugins

Since I don't use the built-in package manager, you need to install the plugins manually. You can do so by cloning the repositories to the `~/.config/nvim/pack/plugins/start` directory. For example, to install Copilot:

```bash
git clone https://github.com/github/copilot.vim.git \
  ~/.config/nvim/pack/github/start/copilot.vim
```
