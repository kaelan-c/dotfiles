#!/bin/bash

# Exit on error
set -e

DOTFILES_DIR="$HOME/dotfiles"
BACKUP_DIR="$DOTFILES_DIR/backups/$(hostname)/$(date +%Y%m%d_%H%M%S)"

# Check if stow is installed
if ! command -v stow >/dev/null 2>&1; then
  echo "GNU Stow is required but not installed."
  echo "Install it with your package manager:"
  echo "  Debian/Ubuntu: sudo apt install stow"
  echo "  Fedora: sudo dnf install stow"
  echo "  macOS: brew install stow"
  exit 1
fi

# Create .stow-local-ignore if it doesn't exist
create_stow_ignore() {
  if [ ! -f "$DOTFILES_DIR/.stow-local-ignore" ]; then
    cat > "$DOTFILES_DIR/.stow-local-ignore" << EOL
^/backups
^/scripts
^/install.sh
^/README
^/.git
^/.gitignore
^/.stow-local-ignore
EOL
  fi
}

# Backup existing gotfiles into the repository
backup_dotfiles() {
  # Create backup directory with hostname to track different machines
  echo "Creatign backup directory at $BACKUP_DIR"
  mkdir -p "$BACKUP_DIR"

  # Loop through all potential dotfiles and back them up if they exist
  for dir in "$DOTFILES_DIR"/*/; do
    dir_name=$(basename "$dir")

    if [[ "$dir_name" =~ ^(backups|scripts|\.git)$ ]]; then
      continue
    fi

    # Create subdirectory in backup to maintain structure
    mkdir -p "$BACKUP_DIR/$dir_name"

    for file in "$dir".*; do
      base_file=$(basename "$file")
      if [ -f "$HOME/$base_file" ]; then
        echo "Backing up $base_file"
        cp "$HOME/$base_file" "$BACKUP_DIR/$dir_name/"
      fi
    done
  done

  # Add backups to git if they are not empty
  if [ -n "$(ls -A "$BACKUP_DIR")" ]; then
    git -C "$DOTFILES_DIR" add "$BACKUP_DIR"
    git -C "$DOTFILES_DIR" commit -m "Backup dotfiles from $(hostname) on $(date +%Y-%m-%d)"
  fi
}

# Stow each configuration
stow_configs() {
  cd "$DOTFILES_DIR"
  for dir in */; do
    dir_name=$(basename "$dir")
    if [[ ! "$dir_name" =~ ^(backups|scripts|\.git)$ ]]; then
      echo "Stowing $dir_name"
      stow -v --no-folding -t "$HOME" "$dir_name"
    fi
  done
}

echo "Setting up stow ignore patterns..."
create_stow_ignore

echo "Backing up existing dotfiles..."
backup_dotfiles

echo "Creating symlinks using stow..."
stow_configs

echo "Installation complete! Backups stored in $BACKUP_DIR"

