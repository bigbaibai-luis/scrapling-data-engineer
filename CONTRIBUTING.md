# Contributing / 贡献指南

Thanks for considering contributing! / 感谢你考虑贡献！

## How to contribute / 如何贡献

1. Fork the repo / Fork 本仓库
2. Create a branch / 新建一个分支
3. Make changes / 进行修改
4. Open a pull request / 提交 Pull Request

## Agent format / 角色格式

The agent file `agents/scrapling-data-engineer.md` follows the agency-agents convention: YAML frontmatter (`name`, `description`, `color`, `emoji`, `vibe`) followed by a system prompt.

角色文件 `agents/scrapling-data-engineer.md` 沿用 agency-agents 约定：YAML frontmatter（`name`、`description`、`color`、`emoji`、`vibe`）+ 系统提示词。

## Rules / 规则

- Keep Scrapling API references accurate — no hallucinated methods / 保持 Scrapling API 引用准确，不编造方法
- Keep the compliance rules intact / 保留合规规则
- Keep `README.md` and `README.zh-CN.md` in sync / 保持中英两份 README 同步

## Local checks / 本地校验

```bash
bash -n scripts/install.sh          # shell 语法
python -m py_compile examples/*.py  # Python 语法
```

CI runs these automatically on every push and pull request / CI 会在每次 push 和 PR 时自动执行这些校验。
