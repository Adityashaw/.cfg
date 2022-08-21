# Dotfiles for Adi

## Requirements
* git

## Starting from scratch

Note: This step is not required to use this repo. It's for creating new bare repo for managing dotfiles.

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

## Installing dotfiles on new system

* Clone this repo:
```bash
git clone --bare git@github.com:Adityashaw/.cfg.git $HOME/.cfg
```

* Define the alias in current shell scope:
```bash
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```

* Checkout the actual content from the bare respository to your `$HOME`:
```bash
config checkout
```

* The step above might fail with a message like:
```bash
error: The following untracked working tree files would be overwritten by checkout:
    .bashrc
Please move or remove them before you can switch branches.
Aborting
```

This happens because those files already exist in your `$HOME`. Backup the files in case it's needed later on.

I am providing two options to backup each file manually. Choose any one of these:
1. Append `_bak` at the end of each file name.
   ```bash
   mv .bashrc .bashrc_bak
   ```
1. Move the files to a backup folder.
   ```bash
   mkdir -p .config-backup
   mv .bashrc .config-backup/
   ```

* Re-run the checkout if you had problems:
```bash
config checkout
```

* Set the flag `showUntrackedFiles` to `no` on this specific (local) repository:
```bash
config config --local status.showUntrackedFiles no
```

* We're done. From now on, we can type `config` commands to add and update our dotfiles.
```bash
config status
config add .vimrc
config commit -m "Add vimrc"
config add .bashrc
config commit -m "Add bashrc"
config push
```

#### The tutorial referred for above process [is here.](https://www.atlassian.com/git/tutorials/dotfiles)
