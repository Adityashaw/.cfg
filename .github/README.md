#Dotfiles for Adi

##Requirements
* git

##Starting from scratch

Note: This step not required to use this repo. It's for creating new bare repo for managing dotfiles.

```bash
git init --bare $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.bashrc
```

1. Line 1 creates a bare repo to track our dotfiles.
1. Line 2 creates an alias over git command to facilitate easily interact with the bare repo.
1. Line 3 prevents showing untracked files which are not interesting to us.
1. Line 4 adds the alias to the bashrc so that you don't have to type it everytime you open shell/terminal.

