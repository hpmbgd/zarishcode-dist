# Getting started with zarishcode

zarishcode is a friendly, ready-to-use build of [OpenCode](https://opencode.ai/v2/docs): it
adds a `zarishcode` command, a theme, a short list of MCP servers, a `/zarish-setup`
walkthrough, and the **zarishnoksha** design skill — on top of everything OpenCode
already does.

This guide takes you from a fresh computer to a working setup. **No coding needed.**
Every command is copy-paste ready — run **one at a time**, top to bottom.

> Never hardcodes your username or home folder. Wherever you see `~`, that means "your
> home folder", whatever it is on your device.

---

## 1. What you need (prerequisites)

| You need | Why | How to check |
|---|---|---|
| A computer with **Linux**, **macOS**, or **Windows (WSL)** | zarishcode runs there | — |
| Internet connection | downloads the pack and signs you in | — |
| **curl** (already on Linux/macOS) | the one-line installer | `curl --version` |
| **Node.js LTS + npm** *(only for the npm path)* | install via npm | `npm --version` |
| **Bun** *(only to run from source)* | build/run the source repo | `bun --version` |

- Install **Node.js LTS** (for the npm path): <https://nodejs.org> → download the LTS
  installer → run it → reopen your terminal.
- Install **Bun** (only for the source path): <https://bun.sh> → follow the one-line
  command shown there.

If a check command prints a version number, you are good.

> **OpenCode V2 is installed for you.** zarishcode is built on OpenCode **V2**.
> The installer detects when OpenCode isn't on your machine and installs V2
> automatically (official OpenCode V2 installer, into `~/.opencode/bin`). You
> don't need to install it beforehand.

---

## 2. Install

### Option A — one line (recommended, nothing to install first)

```sh
curl -fsSL https://raw.githubusercontent.com/hpmbgd/zarishcode-dist/main/install.sh | bash
```

This downloads the pack, puts the commands in `~/.local/bin`, and runs first-run
setup. If OpenCode V2 isn't installed yet, setup installs it for you
automatically. It only fetches the pack from the public distribution repo —
never the private source.

### Option B — npm (if you already use Node.js)

```sh
npm install -g zarishcode && zarishcode-setup
```

Both options end by running the same setup, so you only do **one** of them. Setup
also installs OpenCode V2 automatically when it's missing.

---

## 3. First-run setup (automatic)

`zarishcode-setup` is safe to run any number of times: it **never overwrites** a file you
already have. On a fresh computer you will see lines like:

```
✓ installed command: ~/.local/bin/zarishcode
✓ seeded ~/.config/opencode/cli.json (theme: zarishcode)
✓ seeded ~/.config/opencode/opencode.jsonc (curated MCP servers)
✓ installed /zarish-setup command
✓ installed zarishnoksha design skill (ask it to shape or polish any UI)
```

If you already had some of those files, the matching line says *already exists —
leaving it untouched* instead. That is expected.

### If `zarishcode: command not found`

Your shell does not know about `~/.local/bin` yet. Fix it once:

```sh
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.profile
```

Then close and reopen the terminal (or run `source ~/.profile`). Re-run the installer or
`zarishcode-setup` if you like — it is idempotent.

---

## 4. What was set up (your config)

| File | What it does |
|---|---|
| `~/.config/opencode/cli.json` | sets the **zarishcode** theme |
| `~/.config/opencode/opencode.jsonc` | a short, curated list of **MCP servers** |
| `~/.config/opencode/commands/zarish-setup.md` | the `/zarish-setup` guided onboarding command |
| `~/.config/opencode/skills/zarishnoksha/` | the **zarishnoksha** design skill (available in every project) |

Nothing here renames OpenCode's internals, so updates keep working.

---

## 5. First run (3 steps)

Open zarishcode in a project folder. From your repo or any project directory:

```sh
zarishcode
```

Then type these one at a time:

1. **Connect a provider** — type `/connect`, choose your workspace, and sign in in the
   browser. The models from your OpenCode Console workspace appear after signing in.
2. **Choose a model** — type `/models` and pick one. Free models are tagged **Free**.
3. **Sign in to MCP servers** — type `/mcps`, pick a server, and sign in. The `context7`
   server needs no account.

Tip: type `/zarish-setup` instead and it will walk you through all three, one at a time.

---

## 6. Using it day to day

- **Start** zarishcode from any project folder: `zarishcode`.
- **Design help**: just ask — "design this page", "polish this interface", "audit this
  UI". The zarishnoksha skill answers.
- **Docs lookup**: the `context7` MCP server is on by default (no account needed).
- **More MCP servers**: only `context7` is enabled. Open
  `~/.config/opencode/opencode.jsonc`, remove the `//` in front of a block you want,
  restart zarishcode, then run `/mcps` to sign in.

---

## 7. Updating

- **If you installed with the one-liner or npm**: re-run the same install command. The
  setup is idempotent, so it refreshes the pack without touching your config.
- **If you run from the source checkout** (maintainers): see `ZARISHCODE.md`
  → "Stay updated".

---

## 8. Troubleshooting

| Symptom | Fix |
|---|---|
| `zarishcode: command not found` | Add `~/.local/bin` to PATH (see §3). |
| `opencode: command not found` (when running `zarishcode`) | OpenCode V2 wasn't installed or the terminal is old — close and reopen the terminal, or re-run the installer (it installs OpenCode V2 when missing). |
| `npm: command not found` | Install Node.js LTS from <https://nodejs.org>, reopen the terminal. |
| Installer prints `curl: command not found` | Install curl, or use the npm path (§2, Option B). |
| Theme didn't change | Confirm `~/.config/opencode/cli.json` has `"theme": { "name": "zarishcode" }`, then restart. |
| No MCP servers in `/mcps` | `~/.config/opencode/opencode.jsonc` must contain the `mcp.servers` block; restart zarishcode. |
| Want a clean start | The setup never overwrites, so delete the file you want re-seeded and re-run `zarishcode-setup`. |

---

## 9. Running from source (optional, for maintainers)

Requires **Bun**. From your zarishcode checkout:

```sh
bun install
```

Then follow `DEVELOPMENT.md` for the package-scoped checks and `ZARISHCODE.md` for the
weekly upstream sync. Never run tests or typechecks from the repository root.
