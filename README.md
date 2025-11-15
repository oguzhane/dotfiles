Personal configuration files using chezmoi and devbox.

---

## Overview

This repository centralizes your dotfiles for tools like bash, zsh, vim, tmux, and more. It uses:

- **chezmoi:** To manage, sync, and apply dotfiles safely across machines.
- **devbox:** To quickly provision a set of development tools on any system.

## Prerequisites

- **git:** To clone this repository.
- **chezmoi:** For dotfile management ([install instructions](https://www.chezmoi.io/install/)).
- **devbox:** For managing development environments ([install instructions](https://jetify.com/devbox/docs/installation/)).

## Getting Started

### 1. Install chezmoi

Follow the [official instructions](https://www.chezmoi.io/install/), or on most Unix systems:
```sh
sh -c "$(curl -fsLS get.chezmoi.io)"
```

### 2. Install devbox

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

---

Your repository structure, package choices, and automation with chezmoi and devbox let you quickly bootstrap or maintain consistent developer environments across devices. For any system, after installing chezmoi and devbox per above, your preferred workflow and toolchain can be reflected in minutes.
