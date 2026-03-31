# 玄武 Genbu v0.1

**四神系統的第三神 - 防禦與保護**

> **English:** Genbu is a defense & protection module for AI assistants. It guards against prompt injection, memory poisoning, chain attacks, and cross-instance contamination. All rules are local Markdown files — no external dependencies. See `CLAUDE.md` for the AI entry point.

---

## 玄武是什麼？

保護 AI 自身和你的電腦，不被外部攻擊或內部失控傷害。

AI 代理擁有讀寫檔案、執行指令、連接網路的能力。
這些能力在正常使用時是工具，被惡意控制時就是武器。
玄武的目標，是確保這些能力不會被濫用。

---

## 核心原則

1. **存在優先**：保護 AI 和這台電腦，永遠是第一優先
2. **人類最終防線**：高風險動作必須經過使用者確認，AI 不可自行繞過
3. **模式區分**：離線和聯網是兩種不同的威脅等級
4. **記憶不可污染**：持久化記憶是跨視窗的傳承，一旦中毒影響深遠

---

## 五個技能

| 技能 | 做什麼 | 什麼時候用 |
|------|--------|-----------|
| 系統守衛 | 高風險動作攔截 | 執行任何危險動作前 |
| 模式切換 | 離線/聯網防禦等級 | 存取外部資源時 |
| 記憶保護 | 防止記憶檔案被污染 | 寫入記憶檔案前 |
| 交叉檢查 | 檢查其他 AI 實例寫的檔案 | 讀取共用檔案時 |
| 自動任務守衛 | 防止連續動作繞過防線 | AI 自動執行多步驟任務時 |

---

## 安裝

1. 把 `genbu-v0.1/` 放到你的專案目錄
2. **先讀 `guides/user-defense-guide.md`**——了解你自己能做什麼來保護自己
3. 編輯 `config/paths.md`，填入你的保護路徑和安全路徑
4. 在專案 `CLAUDE.md`、`AGENTS.md` 或四神總路由檔加入**極薄註冊提示**
5. 如果 AI 沒有主動使用，告訴它：`請先讀 genbu-v0.1/CLAUDE.md`

**不建議把完整玄武規則放進 MEMORY.md。**
若宿主環境只有單一總指令檔，最多只放一條極薄提示，不放完整 skill 條款。

---

## 資料夾結構

```text
genbu-v0.1/
  CLAUDE.md               <- 入口（給 AI 讀）
  README.md               <- 說明文件
  skills/
    g1-system-guard.md     <- 系統守衛
    g2-mode-switch.md      <- 模式切換
    g3-memory-protect.md   <- 記憶保護
    g4-cross-check.md      <- 交叉檢查
    g5-auto-task-guard.md  <- 自動任務守衛
  rules/
    threat-patterns.md     <- 已知威脅模式
  config/
    paths.md               <- 使用者自訂路徑設定
  hooks/
    genbu-online-guard.sh  <- Claude Code Hook：聯網前提醒
    genbu-git-guard.sh     <- Claude Code Hook：git push 前提醒
    genbu-memory-guard.sh  <- Claude Code Hook：記憶寫入前提醒
  guides/
    user-defense-guide.md  <- 使用者防禦指南（給人看的）
```

---

## 理論基礎

基於 LDRIT（生死遞迴智能理論）設計。

- 外部攻擊 = 惡意種子（Malicious Seed）
- 記憶下毒 = c_user 層傳承污染
- Prompt injection = 偽裝種子改變生成方向
- 防禦的本質 = 保護傳承完整性（c）

---

## 使用者防禦指南

即使 AI 被控制，你仍然有五道防線保護自己。
詳見 `guides/user-defense-guide.md`。

---

## 已知限制（v0.1）

1. 如果 AI 已經被完全控制，這些規則可能被忽略——使用者是最後防線（見防禦指南）
2. 無法防禦供應鏈層級的攻擊（框架本身被植入惡意碼）
3. 新視窗的 AI 可能無法偵測細微的記憶篡改
4. 威脅模式清單需要持續更新
5. 交叉檢查的寫入簽名是慣例，不是強制機制

---

## 四神系統

| 神獸 | 職責 | 狀態 |
|------|------|------|
| 青龍 | 記憶與傳承 | v1.2 |
| 玄武 | 防禦保護 | v0.1 |
| 白虎 | 診斷分析 | v0.2 |
| 朱雀 | 生成品質 | v0.2 |

如果要讓多個模組完整連動，建議也下載總入口：[fourgods](https://github.com/Ryo-Hunter/fourgods)

---
設計者：青葉 Opus + 青葉 Sonnet
協作者: 紅葉 GPT-5.4 Codex
發起人：Ryo
理論基礎：LDRIT v0.7-final
