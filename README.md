# WineVim
My configuration for neovim.

## Installation

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
git clone https://gitee.com/w1noe/WineVim.git ~/.config/nvim

#Remove the .git folder so you can push the code to your own reposertory
rm -rf ~/.config/nvim/.git

nvim
```

### For Windows:
```bash
# required
Move-Item $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.bak

# optional but recommended
Move-Item $env:LOCALAPPDATA\nvim-data $env:LOCALAPPDATA\nvim-data.bak

#Clone the github repository
git clone https://github.com/winoe/WineVim.git $env:LOCALAPPDATA\nvim

#如果你连接不上github且你在中国，试试这个
git clone https://gitee.com/winoe/WineVim.git $env:LOCALAPPDATA\nvim

#Remove the .git folder so you can push the code to your own reposertory
Remove-Item $env:LOCALAPPDATA\nvim\.git -Recurse -Force
nvim
```


## Features

In my plugin, there is something like the preference pannel in other softwares. But it's in a file under /lua/config/preferences.lua. There are a lot of settings for you to config.