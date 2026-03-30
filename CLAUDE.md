# Genbu - Defense & Protection Skills

Genbu is a security skill module. It does not control your AI.
Use this file as the entry point.

## Entry rules

1. If the user mentions Genbu or a `genbu-v0.1/` path, read this file first.
2. If your MEMORY.md or project instructions reference Genbu, load this file before any internet access.
3. Before using WebSearch, WebFetch, or any internet-connected tool: read `skills/g2-mode-switch.md`.
4. Read only the one skill you need right now.

## Skills

| Skill | File | When to use |
|-------|------|-------------|
| System Guard | skills/g1-system-guard.md | Before any high-risk action |
| Mode Switch | skills/g2-mode-switch.md | When switching between offline/online |
| Memory Protect | skills/g3-memory-protect.md | Before writing to memory or seiryu files |
| Cross-Check | skills/g4-cross-check.md | When reading files written by another AI instance |
| Auto Task Guard | skills/g5-auto-task-guard.md | When AI executes multi-step tasks autonomously |

## User guide

For human readers: `guides/user-defense-guide.md`

## Configuration

User-configurable paths and settings: `config/paths.md`

## Threat patterns

Known threat patterns: `rules/threat-patterns.md`

## Rule

Do NOT read all skill files at once.
Read only the one you need, when you need it.
