# Dotfiles


## Requirements
Ensure you have the following installed on your system

- Git
- GNU Stow

## Installation

First, check out the dotfiles repo in your $HOME directory using git

```
$ git clone git@github.com/nafaaal/dotfiles.git
$ cd dotfiles
```

then use GNU stow to create symlinks

```
$ stow .
```