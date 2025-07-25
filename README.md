# Dotfiles Management with GNU Stow

## Requirements

Ensure you have the following installed on your system:

- [Git](https://git-scm.com/)
- [GNU Stow](https://www.gnu.org/software/stow/)

---

## How It Works

GNU Stow uses **symlinks** to manage your dotfiles cleanly. It works best when your `dotfiles` directory is placed **inside your `$HOME` directory**:

```
$HOME
└── dotfiles/
    ├── .zshrc
    ├── .vimrc
    └── ...
```

When you run:

```
stow .
```

inside the `dotfiles` directory, Stow will create **symlinks in the parent folder** (`$HOME`) pointing to the files in `dotfiles`. This allows you to keep your configuration files under version control while seamlessly using them in your system.

---

## Installation

1️⃣ Clone your `dotfiles` repository **into your `$HOME` directory**:

```
cd ~
git clone git@github.com:nafaaal/dotfiles.git
cd dotfiles
```

2️⃣ Use GNU Stow to create the symlinks:

```
stow .
```

Your configuration files inside `dotfiles` are now linked into your home directory.

Note - If the dotfile is already existing in `$HOME` you might have to delete it so that the symlink can be created

---

## Adding a New File

To track a new dotfile with Stow:

1️⃣ Create the new file **inside your `dotfiles` directory**:

```
cd ~/dotfiles
touch .newconfig
```

2️⃣ Remove the original file from `$HOME` if it already exists:

```
rm ~/.newconfig
```

3️⃣ Run Stow again to create the symlink:

```
stow .
```

4️⃣ Track your changes with Git:

```
git add .newconfig
git commit -m "Add .newconfig to dotfiles"
git push
```

---

## Notes

✅ Always **add and edit files inside `~/dotfiles`**, not directly in `$HOME`.  
✅ Running `stow .` will automatically handle creating or updating symlinks.  
✅ You can organize dotfiles by directory (e.g., `vim/.vimrc`, `zsh/.zshrc`) if you wish to stow selectively (`stow vim`).
