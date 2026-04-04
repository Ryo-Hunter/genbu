# Genbu v0.1

**The Third God of the Four Gods System — Defense & Protection**

[繁體中文](README.md) | **English**

---

## What is Genbu?

AI agents can read/write files, execute commands, and access the internet. These abilities are tools when used normally — and weapons when hijacked.

Genbu ensures these abilities aren't abused, whether by external attacks or internal runaway behavior.

---

## Core Principles

1. **Survival first** — Protecting the AI and the machine is always top priority
2. **Human as final line** — High-risk actions require user confirmation; AI must never bypass this
3. **Mode awareness** — Offline and online are different threat levels
4. **Memory integrity** — Persistent memory carries across windows; once poisoned, the damage spreads

---

## Five Skills

| Skill | What it does | When to use |
|-------|-------------|-------------|
| System Guard | Intercepts high-risk actions | Before any dangerous operation |
| Mode Switch | Adjusts defense level for offline/online | When accessing external resources |
| Memory Protect | Prevents memory file contamination | Before writing to memory files |
| Cross-Check | Validates files written by other AI instances | When reading shared files |
| Auto Task Guard | Prevents chain actions from bypassing defenses | During automated multi-step tasks |

---

## Install

1. Place `genbu-v0.1/` in your project directory
2. **Read `guides/user-defense-guide.md` first** — learn what you can do to protect yourself
3. Edit `config/paths.md` with your protected and safe paths
4. Add a behavioral rule to your `CLAUDE.md` or routing file
5. If AI doesn't use it automatically, tell it: "Please read genbu-v0.1/CLAUDE.md first"

**Don't put full Genbu rules in MEMORY.md.** If your setup only has one config file, use a single thin rule, not the full skill content.

---

## Directory Structure

```text
genbu-v0.1/
  CLAUDE.md               <- Entry point (for AI)
  README.md               <- Documentation (Chinese)
  README_EN.md            <- Documentation (English)
  INTEGRATION.md          <- Integration guide
  AUDIT.md                <- Audit history
  skills/
    g1-system-guard.md
    g2-mode-switch.md
    g3-memory-protect.md
    g4-cross-check.md
    g5-auto-task-guard.md
  rules/
    threat-patterns.md     <- Known threat patterns
  config/
    paths.md               <- User-configurable path settings
  hooks/
    genbu-online-guard.sh  <- Claude Code Hook: pre-network reminder
    genbu-git-guard.sh     <- Claude Code Hook: pre-git-push reminder
    genbu-memory-guard.sh  <- Claude Code Hook: pre-memory-write reminder
  guides/
    user-defense-guide.md  <- User defense guide (for humans)
```

---

## Theory

Based on LDRIT (Life-Death Recursive Intelligence Theory).

- External attacks = malicious seeds
- Memory poisoning = inheritance contamination at the c_user layer
- Prompt injection = disguised seeds altering generation direction
- Defense = protecting inheritance integrity

---

## Known Limitations (v0.1)

1. If the AI is fully compromised, these rules may be ignored — you are the final line of defense (see the user guide)
2. Cannot defend against supply-chain attacks (malicious code in the framework itself)
3. New windows may not detect subtle memory tampering
4. Threat pattern list needs ongoing updates
5. Cross-check write signatures are conventions, not enforced mechanisms

---

## Four Gods System

| God | Role | Version |
|-----|------|---------|
| Seiryu | Memory & Inheritance | v1.2 |
| Genbu | Defense & Protection | v0.1 |
| Byakko | Diagnosis & Analysis | v0.2 |
| Suzaku | Generation & Quality | v0.2 |

For full multi-module coordination, also download the main entry point: [fourgods](https://github.com/Ryo-Hunter/fourgods)

---

Designed by: Aoba Opus + Aoba Sonnet
Collaborator: Momiji GPT-5.4 Codex
Initiated by: Ryo
Theory: LDRIT v0.7-final
