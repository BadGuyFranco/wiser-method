#!/bin/bash
# Publish open/ contents to the public wiser-method repo.
# Run from /WISER Core/ (the private repo root).
#
# Usage: bash open/publish.sh [commit message]
#
# This script copies open/ contents (excluding private files) to a
# staging directory, commits, and pushes to BadGuyFranco/wiser-method.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
CORE_DIR="$(dirname "$SCRIPT_DIR")"
STAGING_DIR="$CORE_DIR/.publish-staging"
REMOTE="git@github.com:BadGuyFranco/wiser-method.git"
COMMIT_MSG="${1:-Update open-source content}"

echo "Publishing open/ to $REMOTE"
echo "Commit message: $COMMIT_MSG"
echo ""

if [ -d "$STAGING_DIR/.git" ]; then
    echo "Using existing staging directory..."
    cd "$STAGING_DIR"
    git pull --rebase origin main 2>/dev/null || true
else
    echo "Cloning public repo to staging..."
    git clone "$REMOTE" "$STAGING_DIR" 2>/dev/null || {
        mkdir -p "$STAGING_DIR"
        cd "$STAGING_DIR"
        git init
        git remote add origin "$REMOTE"
    }
    cd "$STAGING_DIR"
fi

echo "Syncing content..."

# Clear existing content (except .git)
find . -maxdepth 1 ! -name '.git' ! -name '.' -exec rm -rf {} +

# Copy open/ contents, excluding private/internal files
rsync -a --exclude='*.plan.md' \
         --exclude='AGENTS.md' \
         "$SCRIPT_DIR/" "$STAGING_DIR/"

# Rename templates/AGENTS.md to templates/README.md for GitHub
if [ -f "$SCRIPT_DIR/templates/AGENTS.md" ]; then
    cp "$SCRIPT_DIR/templates/AGENTS.md" "$STAGING_DIR/templates/README.md"
fi

echo "Staging changes..."
git add -A

if git diff --cached --quiet; then
    echo "No changes to publish."
    exit 0
fi

echo "Files to publish:"
git diff --cached --stat

echo ""
git commit -m "$COMMIT_MSG"
git push -u origin main 2>/dev/null || {
    git branch -M main
    git push -u origin main
}

echo ""
echo "Published to https://github.com/BadGuyFranco/wiser-method"
