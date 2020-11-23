# You'll need to symlink all your dotfiles to your home directory

# macOs Dev Tools Setup

First things first...how to guide for setting up key dev tools on a new Mac

## Install Homebrew

[Homebrew website](https://brew.sh/ _target=blank)

```

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

```


## Upgrade Bash

macOs ships with an older version of bash due to licensing reasons. It's useful to upgrade the default bash shell to enjoy features in the latest version.

```

brew install bash

```

Run this to list all instances of bash executable found. You should have 2.

```

which -a bash

```


Add the new bash executable to your machine's list of "trusted shells"

```

sudo vim /etc/shells

```

## Upgrade Zsh

```
brew install zsh
which -a zsh

```

Add the new zsh executable to your trusted shells as well

```
sudo vim /etc/shells
```

## Zsh Prompt

```

echo "export PS1="%10F%m%f:%11F%1~%f \$ "" >> ~/.zshrc

```

```

# install this stuff

brew install git
brew install coreutils
brew install python3
brew install ipython3
brew install node
brew install lolcat cowsay fortune

```
