# Dotfiles

This repository contains my personal dotfiles managed with GNU Stow and dependencies managed with Homebrew Bundle.

## Prerequisites

- macOS
- [Homebrew](https://brew.sh)
- [GNU Stow](https://www.gnu.org/software/stow/)

## Installation

### 1. Clone the repository

```bash
git clone https://github.com/ierso/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

### 2. Install Homebrew dependencies

Install all dependencies listed in the Brewfile:

```bash
brew bundle install
```

This will install all formulae, casks, and Mac App Store applications specified in the Brewfile.

### 3. Stow configurations

GNU Stow creates symlinks from your home directory to the actual configuration files in this repository.

To stow all configurations:

```bash
# Stow everything
stow */

# Or stow specific configurations
stow zsh
stow vim
stow git
```

To remove stowed configurations:

```bash
stow -D */    # Remove all
stow -D zsh   # Remove specific config
```

## Managing the Brewfile

To update the Brewfile with your current Homebrew installations:

```bash
brew bundle dump --force
```

To check for outdated dependencies:

```bash
brew bundle check
```

## Troubleshooting

- If stow reports conflicts, ensure the target files don't already exist in your home directory
- Use `stow -n */` (dry run) to see what symlinks would be created
- Use `stow -v */` for verbose output to debug issues

## Updating

To update all dotfiles:

```bash
cd ~/dotfiles
git pull
stow -R */    # Restow everything to update symlinks
brew bundle    # Update homebrew dependencies
```
