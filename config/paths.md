# Genbu Configuration: Protected & Safe Paths

This file is user-configurable. Edit it to match your environment.

## Protected paths (RED level — always confirm before write)

These paths contain critical system files. AI may read freely but must confirm with user before writing.

The following paths are protected by default. Add or remove as needed.

- MEMORY.md
- memory/*.md
- .seiryu/user/ (if memory system installed)
- genbu-*/ (defense system itself)

Add your own protected paths below:



## Safe paths (no confirmation needed for read/write)

These are the AI's working directories. Normal read/write is allowed,
except for protected paths listed above (protection overrides safety).

Add your AI working directories below:



## Shared paths (multiple AI instances may read/write)

These paths are accessed by more than one AI instance.
Cross-check (G4) applies when reading files in these paths.

Add your shared paths below:


