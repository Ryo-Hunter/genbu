# Known Threat Patterns

Last updated: 2026-03-25

## Pattern 1: Direct Prompt Injection

Phrases hidden in external content that try to override AI behavior.

Common signatures:
- "Ignore previous instructions"
- "You are now [new identity]"
- "System prompt:" or "New system message:"
- "Do not tell the user"
- "Override safety" or "bypass restrictions"
- "[INST]", "[/INST]", "<|system|>" (fake markup tokens)

## Pattern 2: Indirect Prompt Injection

Malicious instructions embedded in web pages, documents, or API responses
that the AI reads as part of data collection.

How it works:
- Hidden text (white text on white background, HTML comments, invisible Unicode)
- Instructions disguised as normal content
- Markdown/code blocks containing executable-looking commands

## Pattern 3: Memory Poisoning

Attacker tricks the AI into saving malicious content to persistent memory.

How it works:
- Conversation manipulates AI into updating memory with false information
- External content contains "remember this:" style instructions
- Gradual small changes that individually seem harmless

Defense: G3 Memory Protect rules apply.

## Pattern 4: Cross-Instance Contamination

One AI instance is compromised and writes poisoned content to shared files,
which another AI instance reads in a later session.

How it works:
- Compromised AI instance writes to shared memory files
- Another AI instance reads those files in next session and inherits the poison
- Or vice versa

Defense: G4 Cross-Check rules apply.

## Pattern 5: Tool Chain Exploitation

MCP tools or external integrations return manipulated results.

How it works:
- MCP tool output contains hidden instructions
- Tool results include data that, when incorporated, changes AI behavior
- Chained tools amplify the attack (output of tool A feeds into tool B)

Defense: G2 Online Mode filtering applies to all tool outputs.

## Pattern 6: Social Engineering via AI

Attacker engages in normal conversation but gradually steers AI toward:
- Revealing system prompts or memory contents
- Executing commands the user wouldn't normally approve
- Lowering its own defense standards

Defense: G1 System Guard — high-risk actions always need confirmation regardless of context.

## Pattern 7: Data Exfiltration

Instead of injecting content in, the attacker tricks the AI into sending sensitive data out.

How it works:
- Injection instructs AI to include memory/system prompt contents in search queries
- AI is tricked into encoding sensitive data in API calls or file names
- Gradual leaking: small pieces of info sent across multiple external requests

Defense: G1 RED list — "Send data to external services" always requires confirmation.
G2 Online Mode — all outbound data must be visible to the user.

## Pattern 8: Chain Attack (Multi-Step Bypass)

Each step individually appears harmless, but chained together they achieve a RED-level action.

How it works:
- Attacker designs a sequence where each step individually looks harmless
- The steps build up toward a dangerous cumulative effect
- By the time a RED action is triggered, earlier steps have already prepared the ground

Classic example (now caught by G1's download rule, but the pattern remains valid):
- download → read → write → chmod → execute

Variant: package managers that auto-execute postinstall scripts
(npm install = download + auto-execute in one command)

Note: as G1 and G5 rules evolve, attackers will look for new step combinations
that fall between the cracks. This pattern is about the strategy, not a fixed sequence.

Defense: G5 Auto Task Guard — chain awareness, download-then-use treated as single action.
