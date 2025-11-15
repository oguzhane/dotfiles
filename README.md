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

