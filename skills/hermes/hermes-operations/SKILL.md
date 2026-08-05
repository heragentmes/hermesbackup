---
name: hermes-operations
description: "Hermes ops: backup, cron setup, data mgmt, maintenance."
version: 1.0.0
author: Hermes Agent
license: MIT
tags: [hermes, backup, cron, operations, maintenance, data-management]
---

# Hermes Operations

Operational tasks for maintaining Hermes Agent installations — backups, cron jobs, data management, and routine maintenance.

## Backup to GitHub

Back up critical Hermes data to a GitHub repo using rsync + git with change detection.

### What to Back Up

Essential directories/files from `~/.hermes/` (or `$HERMES_HOME`):

| Item | Why |
|------|-----|
| `memories/` | User memory files (most critical) |
| `config.yaml` | Configuration |
| `SOUL.md` | Agent personality |
| `skills/` | Installed/custom skills |
| `sessions/sessions.json` | Session index |
| `hooks/` | Custom hooks |
| `cron/` | Cron job definitions |
| `kanban/`, `kanban.db` | Kanban board |

**Never back up:** `.env`, `auth.json` (secrets), `state.db`, `*.lock`, `logs/`, `cache/`, `image_cache/`, `audio_cache/`.

### Change Detection Pattern

Use `git diff --cached --stat` after `git add -A` to detect real changes. If empty, skip the push entirely. This avoids redundant hourly commits for unchanged data.

```bash
git add -A
CHANGES=$(git diff --cached --stat)
if [ -z "$CHANGES" ]; then
    echo "No changes detected. Skipping push."
    exit 0
fi
```

### Sync Method

Use `rsync -a --delete` for directories (efficient, handles deletions), `cp` for single files. Always pull latest before pushing to avoid conflicts.

### Cron Job Setup

When creating a backup cron job via the `cronjob` tool:

1. **Model is required** — cron jobs error without `model` set. Always include `model` and `provider` in the update call after creation.
2. Use `enabled_toolsets: ["terminal"]` to minimize token overhead.
3. Schedule: `"every 1h"` for hourly backups.
4. The backup script should be self-contained (no LLM reasoning needed for mechanical sync), but the cron prompt can ask the agent to run it and report.

### Pitfalls

- **Cron job creation fails with "no model configured"** — the `cronjob` tool requires `model` to be set explicitly. Create the job first, then immediately `cronjob action=update` with the model.
- **Always confirm backup schedule with user** — don't assume hourly. Ask whether they want hourly, daily at midnight (`0 0 * * *`), weekly, etc. Daily at midnight is a common preference.
- **Flag exposed credentials immediately** — if a user shares a GitHub PAT, API key, or token in chat, warn them right away and suggest rotating it. Even in private repos, tokens in chat history are a risk.
- **GitHub token in shell commands** — security scanners flag PATs in command lines. User must approve the command. Consider using `git credential store` or SSH keys for recurring operations.
- **Empty repo first push** — if the backup repo is empty, the first push creates the initial commit. Subsequent runs use pull-then-push.
- **Port restrictions** — some environments block non-HTTPS ports. Use HTTPS URLs for git remotes, not SSH.
- **API keys masked in `.env`** — terminal sessions may not have access to the actual API key (it's injected at runtime). Don't attempt to read `.env` to make external API calls — the key will be truncated/masked.

### Script Template

See `scripts/backup.sh` for a complete backup script with change detection.

## Cron Job Management

### Common Patterns

- **Hourly backups:** `schedule: "every 1h"`, script-based with change detection
- **Daily at midnight:** `schedule: "0 0 * * *"` — cron expression, not human-readable. Use this for exact time targeting.
- **Daily reports:** `schedule: "0 9 * * *"`, agent-based with prompt
- **Watchdog:** `no_agent: true` with `script`, stdout delivered verbatim

**Schedule format notes:**
- `every 24h` = relative interval, drifts over time (fires 24h after last run, not at a fixed time)
- `0 0 * * *` = cron expression, fires at exactly midnight every day
- For precise daily timing, always use cron expressions, not `every Xh`

### Key Invariants

- 3-minute hard interrupt per cron run
- `.tick.lock` prevents duplicate ticks
- Cron sessions skip memory by default
- Deliveries are framed with header/footer, not mirrored into gateway sessions
