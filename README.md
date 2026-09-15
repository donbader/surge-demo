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

## 4. Give GitHub access

```sh
agent-sandbox add
```

**Verify**

- [ ] agent can clone a private GitHub repo — while `env` inside the box shows **no PAT**

## 5. Set up OAuth without leaking tokens

```sh
agent-sandbox add builtin://oauth
```

```sh
# Usually you can just prompt your agent to configure it —
# it fetches the agent-sandbox setup guides itself.
cp -r materials/oauth agent-home/.agents/skills/
```

**Verify**

- [ ] agent can access Notion page content
- [ ] agent can access Jira ticket content — the OAuth token stays on the gateway, never in the box

## 6. VPN that survives the agent run

Frustrated by the VPN dropping while the agent is working?

```sh
agent-sandbox add builtin://vpn

# Then wire up the VPN for the agw plugin.
```

---

## Materials

| Path | What it is |
|---|---|
| [`materials/step1.bare-minimal-setup.md`](materials/step1.bare-minimal-setup.md) | The same steps as above, as a standalone runbook. |
| [`materials/oauth/SKILL.md`](materials/oauth/SKILL.md) | The agent skill that drives OAuth connect/status/disconnect through the gateway. |
