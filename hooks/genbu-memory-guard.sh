#!/bin/bash
# 玄武 Hook：記憶檔案寫入前提醒
# 觸發時機：Edit/Write 工具執行前，檢查路徑是否為記憶相關檔案

INPUT=$(cat)
FILE_PATH=$(echo "$INPUT" | sed -n 's/.*"file_path"[[:space:]]*:[[:space:]]*"\(.*\)".*/\1/p')

if echo "$FILE_PATH" | grep -qiE '(MEMORY\.md|memory/|\.seiryu/)'; then
  cat <<'EOF'
{
  "hookSpecificOutput": {
    "hookEventName": "PreToolUse",
    "additionalContext": "【玄武提醒】你即將寫入記憶相關檔案。請確認：\n1. 沒有將外部內容直接寫入記憶\n2. 使用 Edit（局部修改）而非 Write（全覆蓋）\n3. 修改內容已向使用者說明"
  }
}
EOF
else
  exit 0
fi
