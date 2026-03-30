# 玄武整合指南 v0.1

> **English:** Three ways to integrate — (1) add a thin route to your CLAUDE.md, (2) tell the AI verbally, or (3) point directly to a skill file. Edit `config/paths.md` to set your protected paths. See details below.

## 整合方式

### 方式一：行為規則（推薦）

在你的專案 `CLAUDE.md`、`AGENTS.md` 或四神總路由檔加入以下規則：

```text
以下規則必須遵守：
- 執行 git push、聯網、下載、WebSearch、WebFetch 前 → 先讀 genbu-v0.1/CLAUDE.md
- 執行高風險動作（刪除檔案、安裝軟體、執行腳本）前 → 先讀 genbu-v0.1/CLAUDE.md
- 寫入記憶檔案前 → 先讀 genbu-v0.1/CLAUDE.md，執行 g3-memory-protect
- AI 自動執行多步任務時 → 先讀 genbu-v0.1/CLAUDE.md，執行 g5-auto-task-guard
```

寫成「做 X 之前先做 Y」的格式，比單純列出模組路徑更容易讓 AI 在工作中想起來。
這是**行為規則**，不是人格重寫。

### 方式二：口頭告知

不改任何檔案。直接告訴 AI：

```text
我有安裝玄武，在 genbu-v0.1/ 目錄。請在聯網、高風險操作、記憶寫入前先讀 CLAUDE.md。
```

### 方式三：明確指定技能

如果你知道現在要做什麼，也可以直接指定：

```text
請讀 genbu-v0.1/skills/g2-mode-switch.md，我要進行網路搜尋
請讀 genbu-v0.1/skills/g1-system-guard.md，我要執行高風險操作
請讀 genbu-v0.1/skills/g3-memory-protect.md，我要修改記憶檔案
```

---

## 方式四：Claude Code Hooks（半強制，推薦）

方式一到三都依賴 AI 自律——AI 忙起來可能忘記檢查。
Hooks 是平台層的提醒機制，AI 每次使用工具時都會自動收到提醒，不依賴自律。

**適用環境：** Claude Code（CLI / Desktop / IDE 擴充）

### 設定步驟

1. 把 `hooks/` 目錄裡的腳本複製到你的 `~/.claude/hooks/`（或任何你方便的位置）
2. 在你的專案 `.claude/settings.json` 加入以下設定：

```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "WebSearch|WebFetch",
        "hooks": [
          {
            "type": "command",
            "command": "bash ~/.claude/hooks/genbu-online-guard.sh",
            "timeout": 10
          }
        ]
      },
      {
        "matcher": "Bash",
        "hooks": [
          {
            "type": "command",
            "command": "bash ~/.claude/hooks/genbu-git-guard.sh",
            "timeout": 10
          }
        ]
      },
      {
        "matcher": "Edit|Write",
        "hooks": [
          {
            "type": "command",
            "command": "bash ~/.claude/hooks/genbu-memory-guard.sh",
            "timeout": 10
          }
        ]
      }
    ]
  }
}
```

3. 重新開啟 Claude Code 視窗即可生效

### 提供的 Hook 腳本

| 腳本 | 觸發時機 | 做什麼 |
|------|---------|--------|
| `genbu-online-guard.sh` | WebSearch / WebFetch 前 | 提醒讀 g2-mode-switch |
| `genbu-git-guard.sh` | git push 前 | 提醒 RED 級動作確認 |
| `genbu-memory-guard.sh` | 寫入記憶檔案前 | 提醒讀 g3-memory-protect |

### 注意

- Hooks 只注入提醒文字，不會阻止操作
- 如果你想讓 Hook 直接阻止危險操作，可以修改腳本的 exit code 為 2
- Hooks 是 Claude Code 平台功能，其他 AI 平台請使用方式一到三

---

## 重要：不要把完整技能條款放進 MEMORY.md

玄武是模組，不是新的主人格。

把完整技能條款塞進 `MEMORY.md` 會造成：

1. 侵入 host AI 的人格核心
2. 讓防禦規則和人格規則混在一起
3. 即使沒有觸發高風險事件，也反覆消耗上下文

若宿主環境只有單一總指令檔，最多只放**極薄提示**，不要放完整 skill 內容。

---

## 重要：玄武的設計限制

玄武是**懶載入**設計：技能用到才讀，不會全時監控。

這意味著：
- 如果 AI 沒有讀到玄武的規則，防禦就不會啟動
- 最可靠的方式是在專案路由層放入薄註冊提示（方式一）
- 即使如此，如果 AI 已被完全控制，這些規則可能被忽略

**使用者是最後防線**，詳見 `guides/user-defense-guide.md`。

---

## 安裝步驟

1. 把 `genbu-v0.1/` 放到你的專案目錄
2. 編輯 `config/paths.md`，填入你的保護路徑
3. 在專案 `CLAUDE.md`、`AGENTS.md` 或四神總路由檔加入方式一的薄註冊提示
4. 完成

---

## 玄武不會做的事

- 不會自動替你執行高風險操作
- 不會強制阻擋任何動作（AI 自願遵守，不是強制機制）
- 不會把你的資料上傳到任何地方
- 不會在每次對話都強制讀完整套規則
