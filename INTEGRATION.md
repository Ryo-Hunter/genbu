# 玄武整合指南 v0.1

> **English:** Three ways to integrate — (1) add a thin route to your CLAUDE.md, (2) tell the AI verbally, or (3) point directly to a skill file. Edit `config/paths.md` to set your protected paths. See details below.

## 整合方式

### 方式一：薄路由註冊（推薦）

在你的專案 `CLAUDE.md`、`AGENTS.md` 或四神總路由檔加入極薄提示：

```text
Defense module: genbu-v0.1/
Before internet access, high-risk actions, or protected memory writes: read genbu-v0.1/CLAUDE.md first.
```

這樣 host AI 知道玄武存在，也知道什麼情況該先讀入口檔。
這是一個**路由提示**，不是人格重寫。

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
