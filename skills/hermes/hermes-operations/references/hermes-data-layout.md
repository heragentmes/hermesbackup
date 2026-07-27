# Hermes Data Directory Structure

Quick reference for `~/.hermes/` (or `$HERMES_HOME`) layout.

## Safe to Back Up

| Path | Type | Description |
|------|------|-------------|
| `memories/` | dir | User memory .md files — highest priority |
| `config.yaml` | file | All settings (non-secret) |
| `SOUL.md` | file | Agent personality/identity |
| `skills/` | dir | Installed + custom skills |
| `sessions/sessions.json` | file | Session routing index |
| `hooks/` | dir | Custom webhook hooks |
| `cron/` | dir | Cron job definitions + execution log |
| `kanban/` | dir | Kanban board data |
| `kanban.db` | file | Kanban SQLite database |

## Never Back Up (secrets/temp)

| Path | Reason |
|------|--------|
| `.env` | API keys, tokens |
| `auth.json` | OAuth tokens, credential pools |
| `state.db` | Ephemeral session state (large, regenerable) |
| `*.lock` | Lock files |
| `logs/` | Runtime logs |
| `cache/` | Model/provider caches |
| `image_cache/`, `audio_cache/` | Media caches |
| `models_dev_cache.json` | Large model catalog cache |
| `provider_models_cache.json` | Provider cache |

## Profile Layout

When using profiles: `~/.hermes/profiles/<name>/` mirrors the same structure. Resolve the real home from `$HERMES_HOME` — never hardcode `~/.hermes`.
