# surge-demo

Demo for **surge** — a hands-on walkthrough of [`agent-sandbox`](https://github.com/payfazz/ai-core/tree/main/agent-sandbox/v2): run an AI agent that does real work with your credentials, yet never sees them and can't leak anything.

Each step below has a verification checkbox — that's the "money shot" to show on screen.

## 1. Installation

```sh
npm install -g @payfazz/agent-sandbox-cli@latest
```

## 2. Init

```sh
agent-sandbox init
```

## 3. Set up secrets

```sh
# Usually it's `cp .agent-sandbox/.env.example .agent-sandbox/.env`
# and fill it in manually.

cp materials/.env .agent-sandbox/
```

## 4. Run container and test it out

```sh
# agent-sandbox run <script> is configured
# in config.yaml as well
agent-sandbox run up

# Connect to VPN since we are using agw
vpn-connect # It's Corey's shortcut command

agent-sandbox run shell

# Spin up the deepseek harness web server for demo purpose
$ dsh web --no-open
```

**Verify**

- [ ] agent can clone a private GitHub repo — while `env` inside the box shows **no PAT**

## 5. VPN that survives the agent run

Frustrated by the VPN dropping while the agent is working?

```sh
# 1. Add vpn plugin
agent-sandbox add builtin://vpn

# 2. Wire up the VPN for the agw plugin.

# 3. Corey's shortcut for vpn disconnection
vpn-disconnect

# 4. up and run
agent-sandbox up
agent-sandbox shell
$ dsh web --no-open
```

## 6. Set up OAuth without leaking tokens

After setting this up, future oauth mcps just need to configure on agent level.

```sh
agent-sandbox add builtin://oauth
```

```sh
# Usually you can just prompt your agent to configure it —
# it fetches the agent-sandbox setup guides itself.

# 1. Copy the oauth skill
mkdir -p agent-home/.agents/skills
cp -r materials/oauth agent-home/.agents/skills/

# 2. Setup deepseek harness mcps
cat materials/dsh-mcp-setup.yml >> agent-home/.dsh/profiles/web/cordis.patch.yml
```

**Verify**

- [ ] agent can access Notion page content
- [ ] agent can access Jira ticket content — the OAuth token stays on the gateway, never in the box

---

## Materials

| Path                                                                             | What it is                                                                       |
| -------------------------------------------------------------------------------- | -------------------------------------------------------------------------------- |
| [`materials/step1.bare-minimal-setup.md`](materials/step1.bare-minimal-setup.md) | The same steps as above, as a standalone runbook.                                |
| [`materials/oauth/SKILL.md`](materials/oauth/SKILL.md)                           | The agent skill that drives OAuth connect/status/disconnect through the gateway. |
