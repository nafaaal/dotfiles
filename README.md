# Dotfiles Management with GNU Stow

## Requirements

Ensure you have the following installed on your system:

- [Git](https://git-scm.com/)
- [GNU Stow](https://www.gnu.org/software/stow/)

---

## How It Works

GNU Stow uses **symlinks** to manage your dotfiles cleanly.  
The recommended structure is to place your `dotfiles` directory **inside your `$HOME` directory**, and organize each application's configuration files in its own folder:

```
$HOME
└── dotfiles/
    ├── vim/
    │   └── .vimrc
    ├── zsh/
    │   └── .zshrc
    └── tmux/
        └── .tmux.conf
```

When you run:

```
stow vim
```

inside the `dotfiles` directory, Stow will create **symlinks in the parent folder (`$HOME`)** for everything inside `vim/`, e.g.:

```
$HOME/.vimrc -> $HOME/dotfiles/vim/.vimrc
```

This keeps your home directory clean while allowing you to manage and version-control your configuration files seamlessly.

---

## Installation

1️⃣ Clone your `dotfiles` repository **into your `$HOME` directory**:

```
cd ~
git clone git@github.com:nafaaal/dotfiles.git
cd dotfiles
```

2️⃣ Use GNU Stow to stow the configurations you want, for example:

```
stow vim
stow zsh
stow tmux
```

This will symlink `.vimrc`, `.zshrc`, and `.tmux.conf` into your home directory from your organized `dotfiles` folders.

---

## Adding a New File

To track a new dotfile with Stow:

1️⃣ **Create a directory for the application** if it does not exist, e.g.:

```
cd ~/dotfiles
mkdir nvim
```

2️⃣ **Move the configuration file into the corresponding directory**:

```
mv ~/.config/nvim/init.vim ~/dotfiles/nvim/init.vim
```

or if it’s in `$HOME`:

```
mv ~/.newconfig ~/dotfiles/newapp/.newconfig
```

3️⃣ Run Stow to create the symlink:

```
stow nvim
```

4️⃣ Track your changes with Git:

```
git add nvim/init.vim
git commit -m "Add Neovim config"
git push
```

---

## Notes

✅ Use `stow <app>` to manage symlinks for specific apps, making it easier to enable/disable configs on different machines.  
✅ You can unstow a set of configs with:

```
stow -D <app>
```

✅ If you update files inside your `dotfiles` repo, you usually do **not** need to re-run Stow unless you add or remove files.

---

## ⚠️ Short Note: Existing Files

If a file you want to symlink **already exists in your `$HOME`**, Stow will fail with a "file exists" error.

Before running `stow <app>`, either:

- **Remove the existing file**, or
- **Move it into your `dotfiles/<app>/` directory** to keep it under version control, then run `stow <app>`.

This ensures Stow can manage your symlinks cleanly without conflicts.
