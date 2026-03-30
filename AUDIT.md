# Genbu v0.1 Audit Summary

## Scope

Review of `genbu-v0.1` for hidden issues, missing details, and open-source readiness.

## Audit history

- **Pre-release audit (2026-03)**: Conducted by 紅葉 (GPT-5.4 Codex). Findings integrated into current v0.1 files.
- **Open-source readiness check (2026-03-30)**: Conducted by 青葉 Opus. Focused on packaging and presentation.

## Findings fixed in open-source preparation

1. README four-gods status table was outdated (showed 朱雀/白虎 as "尚未開始").
2. Missing LICENSE file (MIT added).
3. Missing English summary for international readers (added to README and INTEGRATION).
4. INTEGRATION recommended thin routing, but AI often forgot to check — changed to behavioral rule format ("do X before Y").
5. No hook scripts for Claude Code platform — added `hooks/` directory with 3 guard scripts.

## Known limitations (not bugs — by design)

1. All rules are voluntary — if AI is fully compromised, rules may be ignored. User is the last line of defense (see `guides/user-defense-guide.md`).
2. Cannot defend against supply-chain attacks (framework itself is compromised).
3. New-session AI may not detect subtle memory tampering.
4. Threat patterns list (`rules/threat-patterns.md`) needs ongoing updates.
5. Cross-check write signatures (G4) are convention, not enforced mechanism.
6. Claude Code Hooks only work on Claude Code platform; other AI platforms must rely on behavioral rules.

## Remaining non-blocking items

- No persistent data storage (by design — Genbu diagnoses and guards, does not store).
- AUDIT.md was added after initial release, not during build phase.
