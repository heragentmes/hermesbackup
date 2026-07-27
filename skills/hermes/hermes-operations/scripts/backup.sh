#!/bin/bash
# Hermes Agent Backup Script
# Backs up memories, config, skills, sessions, hooks, cron to GitHub
# Only pushes if actual changes are detected

set -euo pipefail

HERMES_DIR="$HOME/.hermes"
BACKUP_DIR="/tmp/hermesbackup"
REPO_URL="<SET_YOUR_REPO_URL_HERE>"  # e.g. https://user:token@github.com/user/repo.git
LOG_FILE="/tmp/hermes-backup.log"

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

# Ensure backup directory exists and is a git repo
if [ ! -d "$BACKUP_DIR/.git" ]; then
    log "Cloning backup repo..."
    git clone "$REPO_URL" "$BACKUP_DIR" 2>/dev/null || {
        log "ERROR: Failed to clone repo"
        exit 1
    }
fi

cd "$BACKUP_DIR"

# Configure git
git config user.email "hermes-backup@bot"
git config user.name "Hermes Backup Bot"

# Pull latest changes first
git pull origin main 2>/dev/null || git pull origin master 2>/dev/null || true

# Files and directories to back up (relative to HERMES_DIR)
ITEMS=(
    "memories"
    "config.yaml"
    "SOUL.md"
    "skills"
    "sessions"
    "hooks"
    "cron"
    "kanban"
    "kanban.db"
)

# Sync each item
for item in "${ITEMS[@]}"; do
    src="$HERMES_DIR/$item"
    dst="$BACKUP_DIR/$item"

    if [ -e "$src" ]; then
        if [ -d "$src" ]; then
            # Directory: use rsync for efficient sync
            rsync -a --delete "$src/" "$dst/" 2>/dev/null || {
                mkdir -p "$dst"
                cp -a "$src/"* "$dst/" 2>/dev/null || true
            }
        else
            # File
            mkdir -p "$(dirname "$dst")"
            cp "$src" "$dst" 2>/dev/null || true
        fi
    fi
done

# Check if there are actual changes
git add -A
CHANGES=$(git diff --cached --stat)

if [ -z "$CHANGES" ]; then
    log "No changes detected. Skipping push."
    exit 0
fi

# Commit and push
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
git commit -m "Auto backup: $TIMESTAMP" 2>/dev/null
git push origin main 2>/dev/null || git push origin master 2>/dev/null

log "Backup pushed successfully at $TIMESTAMP"
log "Changes: $CHANGES"
