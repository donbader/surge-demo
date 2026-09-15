# Agent Sandbox — in-repo index

This project is wrapped by an agent-sandbox: a Docker/Podman container fronted
by a gateway that controls egress and injects secrets. This file is a thin
ROUTER, frozen at init — it does NOT know this sandbox's current config. For
anything config- or setup-specific, run `agent-sandbox manual`, which is
computed LIVE from this sandbox's config and is always current. Do not answer a
setup or config question from this file alone.

## For the AI agent

- Setting something up (auth, a service, a credential)? Run
  `agent-sandbox manual setup` FIRST — it prints the concrete, per-plugin steps
  for THIS sandbox's actual config, including which secret model applies.
- `agent-sandbox manual` (no topic) lists every available topic, including a
  live plugin catalog, the config schema, and how to author a local plugin.

To add or remove a plugin, edit the `plugins:` list in `config.yaml` directly:
add a `- plugin: builtin://<name>` entry to install one, or delete its list
entry to remove it. After changing config, apply it by running
`agent-sandbox generate`, then re-run `agent-sandbox manual setup`.

Two secret models exist; `agent-sandbox manual setup` tells you which applies to
your task — do not assume from this file:

- Egress rules live under `services.gateway.egress`; requests not matching any
  rule are blocked (deny-by-default). Run `agent-sandbox manual config` for the
  shape.
- Some flows need a secret you declare under the top-level `secrets:` map and
  reference in an egress header as `${{secrets.<group>.<name>}}` (the gateway
  injects it; the agent never holds it). Others (e.g. interactive OAuth login)
  need NO stored secret at all. Whichever applies, the gateway holds every
  secret — the agent never does.

## For humans

Quickstart:

- Install: `npm install -g @payfazz/agent-sandbox-cli`
- Upgrade: `npm install -g @payfazz/agent-sandbox-cli@latest` then `agent-sandbox generate`
- Run: `agent-sandbox run up`

Full detail lives in the repo README: https://github.com/payfazz/ai-core
