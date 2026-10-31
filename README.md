# Block.Chen's Blog

Hexo 6 + ayer 主题的个人博客。

- 线上站点：<https://www.b70.tech/>
- 托管方式：Vercel，**从源码构建**（`hexo generate` → 输出目录 `public`）
- 发布方式：**推送到 `main` 就自动上线**，不需要本地“部署”

## 日常更新流程

```powershell
.\tools\new-post.cmd -Title "文章标题"   # 1. 新建文章（自动带同名图片文件夹）
.\tools\dev.cmd                          # 2. 本地预览 http://127.0.0.1:4000/
.\tools\publish.cmd -Message "新增文章：xxx"   # 3. 提交并推送，Vercel 随后自动构建上线
```

图片丢进 `source/_posts/文章标题/`，正文里直接写 `![](图片名.png)`，
`hexo-asset-image` 会自动改写成永久链接。想要“摘要截断”，在需要的位置写一行 `<!--more-->`。

front-matter 格式：

```yaml
---
title: 文章标题
date: 2026-02-14 20:00:00
tags: 日常
---
```

## 目录速览

| 路径 | 作用 |
| --- | --- |
| `source/_posts/` | 文章 Markdown + 同名图片文件夹 |
| `source/friends/`、`source/tags/` | 友链页、标签页 |
| `source/images/` | 站点图片（封面、头像、二维码等） |
| `themes/ayer/` | 主题源码，`_config.yml` 改外观和侧边栏 |
| `_config.yml` | 站点配置：域名、永久链接、搜索、插件 |
| `tools/` | 本地脚本（`.cmd` 包一层，因为本机执行策略禁止直接跑 `.ps1`） |
| `public/` | 构建产物，**不入版本库**（见下文） |

## 构建与工具链

线上用 npm + `package-lock.json` 安装依赖（hexo 6.2.0 / hexo-util 2.7.0 /
hexo-generator-searchdb 1.4.0）。本地要完全复现线上，用同样的方式：

```powershell
# 本会话的机器上没装 Node/npm，仓库里 .tools/ 备了一份 npm 10.9.2（已 gitignore）
$node = "$env:USERPROFILE\.dsh\dsh-runtimes\dsh-primary-runtime\dependencies\node\bin"
$env:PATH = "$node;$env:PATH"
node .tools\package\bin\npm-cli.js ci --cache .tools\npm-cache
```

如果是在自己装了 Node 的机器上，直接 `npm ci` 即可。

Node 版本固定为 **24.x**（`package.json` 的 `engines` 字段，Vercel 构建时会读取它）。
Vercel 面板的 Project Settings → Node.js Version 建议也同步设成 24.x，双保险。
本地实测 Node 24.21 下 `hexo generate` 正常。

```powershell
.\tools\build.cmd            # 本地全量构建到 public/，只是给你自己看
.\tools\build.cmd -NoClean   # 增量
```

## 关于 `public/`

`public/` 是构建产物，**不应该提交**。仓库里目前还留着 56 个历史文件，后果是：
Vercel 构建时会先检出这些旧文件，而 `hexo generate` 不会删除多余内容，于是早已删除的
文章页面一直在线上挂着（`/2022/08/12/hello-world/`、`/2022/08/13/test/`、`/test2/`）。

清理方式（待你确认后执行，也可自己跑）：

```powershell
git rm -r --cached public
Add-Content .gitignore "public/"
git commit -m "chore: 不再提交构建产物 public/"
git push
```

推上去之后下一次 Vercel 构建就是干净产物，那些旧页面会一起消失。

## 这次重建修掉的问题

1. **域名过期**：`_config.yml` 里 `url` 还是 `https://www.b70.buzz/`（该域名已不可用），
   导致 sitemap 和 RSS 里的链接全指向死域名。已改为 `https://www.b70.tech/`。
2. **`ads.txt` / Google 验证页会丢**：原来只存在于 `public/`，一旦构建目录被清理就没了。
   已移入 `source/`，并用 `skip_render` 原样拷贝，每次构建都在。
3. **站内搜索配置显式化**：ayer 主题前端固定请求 `/search.xml`，已在 `_config.yml`
   写明 `search.path: search.xml`，以后升级 searchdb 也不会退回 `search.json`。
4. **本地工具链对齐线上**：之前本地装成了 hexo 6.3.0 / searchdb 1.5.0，构建结果和线上不一致；
   现在按 `package-lock.json` 安装，本地构建与线上逐字节一致（仅页脚年份按当前日期变化）。
5. **Vercel 构建直接被 Node 16 卡死**：项目面板里 Node 版本还停在已停止支持的 `16.x`，
   推代码后构建立刻报 `Found invalid or discontinued Node.js Version: "16.x"`。
   已在 `package.json` 用 `engines.node = 24.x` 固定，重新部署成功。

## 本机（DSH 沙箱）特有的两个坑

- **git 走 HTTPS 报 `SEC_E_NO_CREDENTIALS`**：沙箱下 schannel 拿不到凭证，需要 OpenSSL 后端。
  `tools/env.ps1` 已自动注入；手工命令写 `git -c http.sslBackend=openssl ...`。
- **推送需要凭证**：受限模式下 Git Credential Manager 起不来（`could not read Username`），
  需要放宽权限或在本机终端推送。
