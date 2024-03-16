# My Personal NeoVim Configuration

Very simple configuration of NeoVim using built-in package manager. I use [Copilot](https://github.com/features/copilot) as a completion engine without any LSPs. Goal is to have a very clean and editing focused environment.

## Installation

Before you start, make sure that you have installed [NeoVim](https://neovim.io) and [Git](https://http://git-scm.com) on your system. Then, backup your current configuration if you have any:

```bash
mv ~/.config/nvim ~/.config/nvim.bak
```

Clone this repository into your `~/.config` directory:

```bash
git clone https://github.com/nizamiza/nvim.git ~/.config/nvim
```

## Installing Plugins

Although I use built-in package manager, I have a rudimentary package manager implemented in [`lua/plugins/init.lua`](lua/plugins/init.lua).

### To install a plugin:

1. Add plugin name in `github-user/repo-name` format to the list in [`lua/plugins/list.lua`](lua/plugins/list.lua).
2. Restart NeoVim.
3. Run `:PluginInstall <plugin-name>` to install the plugin. Alternlatively, run `:PluginInstallAll` to install all plugins.

### To update a plugin:

1. Run `:PluginUpdate <plugin-name>` or `:PluginUpdateAll` to update all plugins.

### To delete a plugin:

1. Run `:PluginDelete <plugin-name>`.

### Configuring Plugins

All plugin configurations are located in [`lua/plugins/config.lua`](lua/plugins/config.lua).

