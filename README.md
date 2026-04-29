# WineVim
My configuration for neovim.

## Installation

### Requires
1. npm, nodejs
2. gcc, g++, cmake, ninja
3. python

*  Then, after installing plugins, in Mason you should install: 

codelldb stylua

### For linux & mac:
```bash
# required
mv ~/.config/nvim{,.bak}

# optional but recommended
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}

#Clone the github repository
git clone https://github.com/w1noe/WineVim.git ~/.config/nvim

#如果连接不上github, 且你在中国，试试这个.
git clone https://gitee.com/winoe/WineVim.git ~/.config/nvim

#Remove the .git folder so you can push the code to your own reposertory
rm -rf ~/.config/nvim/.git

nvim
```

### For Windows:

Scoop is highly recommended, visit https://scoop.sh/ to install.

```bash
# required
Move-Item $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.bak

# optional but recommended
Move-Item $env:LOCALAPPDATA\nvim-data $env:LOCALAPPDATA\nvim-data.bak

#Clone the github repository
git clone https://github.com/w1noe/WineVim.git $env:LOCALAPPDATA\nvim

#如果你连接不上github且你在中国，试试这个
git clone https://gitee.com/winoe/WineVim.git $env:LOCALAPPDATA\nvim

#Remove the .git folder so you can push the code to your own reposertory
Remove-Item $env:LOCALAPPDATA\nvim\.git -Recurse -Force
nvim
```


### Required commands

For windows:
```bash
cd "%LOCALAPPDATA%\nvim-data\lazy\markdown-preview.nvim\app" && npm install
```

For mac & linux:
```bash
cd ~/.local/share/nvim/lazy/markdown-preview.nvim/app && npm install
```

## Features

In my plugin, there is something like the preference pannel in other softwares. But it's in a file under /lua/config/preferences.lua. There are a lot of settings for you to config.

