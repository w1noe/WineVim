# WineVim
My configuration for neovim.

## Installation

Refered the install of lazyvim.

### For linux & mac:
```bash
# required
mv ~/.config/nvim{,.bak}

# optional but recommended
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}

#Clone the github repository
git clone https://github.com/LazyVim/starter ~/.config/nvim

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
git clone https://github.com/w1noe/WineVim.git $env:LOCALAPPDATA\nvim

#Remove the .git folder so you can push the code to your own reposertory
Remove-Item $env:LOCALAPPDATA\nvim\.git -Recurse -Force
nvim
```


## Features
