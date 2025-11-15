Personal configuration files using chezmoi and devbox.

---

## Overview

This repository centralizes your dotfiles for tools like bash, zsh, vim, tmux, and more. It uses:

- **chezmoi:** To manage, sync, and apply dotfiles safely across machines.
- **devbox:** To quickly provision a set of development tools on any system.

## Prerequisites

- **git:** To clone this repository.
- **zsh:** Required shell for Oh My Zsh.
- **chezmoi:** For dotfile management ([install instructions](https://www.chezmoi.io/install/)).
- **devbox:** For managing development environments ([install instructions](https://jetify.com/devbox/docs/installation/)).

## Getting Started

### 1. Install Oh My Zsh

Oh My Zsh is a popular framework for managing Zsh configuration. Your dotfiles expect it:

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

This will set up the base infrastructure for customizing your Zsh with themes and plugins.

### 2. Install chezmoi

Follow the [official instructions](https://www.chezmoi.io/install/), or on most Unix systems:
```sh
sh -c "$(curl -fsLS get.chezmoi.io)"
```

**Note:** Add `bin/` to your PATH (temporary, for current session):
```sh
export PATH="~/bin:$PATH"
```
Now `chezmoi` will work when you type just `chezmoi` as long as you are in your repository root.

### 3. Install devbox

Refer to the [devbox installation guide](https://jetify.com/devbox/docs/installation/) or run:
```sh
curl -fsSL https://get.jetify.com/devbox | bash
```
Or using Homebrew:
```sh
brew install jetify-devbox/devbox/devbox
```

## Installation

### 1. Clone and Apply Dotfiles

```sh
chezmoi init oguzhane
chezmoi apply
```

This will set up your dotfiles as configured in this repository.

### 2. Provision Development Tools with devbox

Your app list is maintained in:
- `dot_local/share/devbox/global/default/devbox.json`
  ([view file](https://github.com/oguzhane/dotfiles/blob/main/dot_local/share/devbox/global/default/devbox.json))

Sample packages (with version locking) in your devbox:
- `gh` (GitHub CLI)
- `youtube-dl`
- `httpie`
- `fzf`
- `lazydocker`
- `joshuto`
- `oh-my-posh`
- `tmux`

To set up all listed apps, run from the repo root:
```sh
cd dot_local/share/devbox/global/default
devbox install
```

This will download and make available each tool as defined in `devbox.json`.

### 3. Configure Oh My Posh Fonts (Optional but Recommended)

After devbox installs the global apps (including `oh-my-posh`), you can set up Oh My Posh with Nerd Fonts for a beautiful terminal prompt experience.

#### Windows Setup

1. **Install Oh My Posh on Windows (PowerShell):**
   
   Oh My Posh should also be installed on the host separately:
   ```powershell
   winget install JanDeDobbeleer.OhMyPosh -s winget
   ```

2. **Install Nerd Font (as Administrator):**
   
   Open a new Windows Terminal as Administrator, then in a PowerShell session, run:
   ```powershell
   oh-my-posh font install meslo
   ```
   
   This installs the MesloLGM Nerd Font system-wide.

3. **Configure Windows Terminal to Use the Nerd Font:**
   
   Open Windows Terminal settings (default shortcut: `CTRL + SHIFT + ,`) and modify your `settings.json` file. Add the `font.face` attribute under the `defaults` attribute in `profiles`:
   
   ```json
   {
       "profiles":
       {
           "defaults":
           {
               "font":
               {
                   "face": "MesloLGM Nerd Font"
               }
           }
       }
   }
   ```
   
   Save the file and restart Windows Terminal to see the icons displayed properly in Oh My Posh.

**Note:** Nerd Fonts need to be installed on the host system (not inside WSL or containers) since this is a UI setting for your terminal emulator.

## Updating Your Dotfiles

When you make changes to your dotfiles (e.g., `.zshrc`), use chezmoi to track and commit them:

### 1. Add the Updated File to chezmoi

If you've edited a file like `~/.zshrc`, tell chezmoi to update its source:

```sh
chezmoi add ~/.zshrc
```

This copies your modified file into chezmoi's source directory.

### 2. Review the Changes

See what changed:

```sh
chezmoi diff
```

Or check the status of all managed files:

```sh
chezmoi status
```

### 3. Commit and Push to GitHub

Navigate to your chezmoi source directory and commit the changes:

```sh
chezmoi cd
git add .
git commit -m "Update .zshrc configuration"
git push
```

Or use a one-liner from anywhere:

```sh
chezmoi cd && git add . && git commit -m "Update .zshrc" && git push && cd -
```

This ensures your dotfiles repository stays in sync with your local changes.
