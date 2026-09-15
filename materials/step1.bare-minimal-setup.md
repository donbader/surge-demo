# 1. Installation

```sh
npm install -g @payfazz/agent-sandbox-cli@latest
```

# 2. Init

```sh
agent-sandbox init
```

# 3. Setup secrets

```sh
# Usually it's `cp .agent-sandbox/.env.example .agent-sandbox/.env`
# and setup manually

cp materials/.env .agent-sandbox/
```

# 4. Give Github Access

```sh
agent-sandbox add
```

Verification:

- [ ] agent can clone github private repo

# 5. Setup Oauth without leaking tokens

```sh
agent-sandbox add builtin://oauth
```

```sh
# Usually can prompt your agent to configure it
# It would fetch the agent-sandbox related setup guides
cp -r materials/oauth agent-home/.agents/skills/
```

**Verification**

- [ ] agent can access notion page content
- [ ] agent can access jira ticket content
