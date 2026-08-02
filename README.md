# Server Setup Script

Installs all the essential tools (Node.js, PM2, Nginx, Git, UFW) needed for deployment on a fresh Ubuntu server — in a single command.

> ⚠️ **Warning:** This script is meant for a **new / fresh server**. There's no need to run it on a server where these tools are already installed.

---

## 🚀 Three Ways to Use It

---

### 1. Run directly (full command, with bash)

One line — the script is fetched from GitHub and runs immediately:

```bash
curl -fsSL https://raw.githubusercontent.com/Tonmoysifat/server-setup/refs/heads/main/server-setup.sh | bash
```

**When to use:** When you trust the script and want to run it quickly.

---

### 2. Read only (without bash)

Prints the script to your screen **without running it** — so you can review what it does:

```bash
curl -fsSL https://raw.githubusercontent.com/Tonmoysifat/server-setup/refs/heads/main/server-setup.sh
```

**When to use:** When you want to verify the script's contents before running. (A good security habit — "know what you run.")

> **Note:** This command only *displays* the script; it does not save it. So you cannot run it afterward from this command alone. To read *and then* run, use option 3 below.

---

### 3. Read, then run safely (download, review, execute)

The safest approach — download it as a file first, read it, then run:

```bash
# Step a — download the script as a file
curl -fsSL https://raw.githubusercontent.com/Tonmoysifat/server-setup/refs/heads/main/server-setup.sh -o server-setup.sh

# Step b — read it to see what's inside
cat server-setup.sh
# (or: nano server-setup.sh)

# Step c — once you're satisfied, make it executable
chmod +x server-setup.sh

# Step d — run it
./server-setup.sh
```

**When to use:** The safest option — review, verify, then run. Recommended for production.

> **Why download first?** A pipe (`| bash`) streams the script once — it's either *shown* or *run*, not both. Saving it as a file lets you read it as many times as you like and run it only when you're sure.

---

## 📋 What This Script Installs

| Tool | Purpose |
|------|---------|
| Node.js (v24 LTS) | JavaScript runtime |
| PM2 | keeps apps always-on |
| Nginx | reverse proxy / web server |
| Git | for pulling code |
| UFW | firewall (SSH + web ports opened) |

---

## ⚠️ Security Notes

- This script contains **no secrets** (no passwords, keys, or connection strings) — so a public repo is safe.
- Never store secrets (`.env`, keys) in this repo.
- Always **read** a script before running it, especially one written by someone else (use option 2 or 3).
- Keep your GitHub account secure (strong password + 2FA).
- A public repo means anyone can **read** your code, but **not** push to it — only you (or collaborators you add) can change it.
