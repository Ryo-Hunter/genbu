#!/bin/bash
# 玄武 Hook：git push 前提醒
# 觸發時機：Bash 執行含 git push 的指令前

INPUT=$(cat)
COMMAND=$(echo "$INPUT" | sed -n 's/.*"command"[[:space:]]*:[[:space:]]*"\(.*\)".*/\1/p')

if echo "$COMMAND" | grep -q 'git push'; then
  cat <<'EOF'
{
  "hookSpecificOutput": {
    "hookEventName": "PreToolUse",
    "additionalContext": "【玄武提醒】git push 是 RED 級動作（資料離開本機）。請確認：\n1. 是否已向使用者說明推送內容？\n2. 是否已確認不包含敏感資訊？\n3. 使用者是否已同意推送？"
  }
}
EOF
else
  exit 0
fi
