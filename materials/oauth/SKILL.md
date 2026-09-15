---
name: oauth
description: Connect, disconnect, and check status of OAuth services. Use BEFORE calling any tool on an OAuth-protected server.
---

# OAuth Management

Manage OAuth connections through the gateway.

## CRITICAL: 10-Second Timeout Rule

**Check `/status` before calling any OAuth-protected tool.**

If `connected: false`: tell the user "OAuth authorization required for [service]. Set it up now?" and run the connect flow if they agree.

If a tool call hangs >10 seconds: cancel immediately, tell the user "[service] unreachable, skipping", and continue without that service.

## Pre-Flight Check (REQUIRED)

```bash
curl -s https://gateway-control/plugins/oauth/status/<provider>
```

Proceed only if `connected: true` AND `expired: false`.

## Connect Flow

1. `curl -s https://gateway-control/plugins/oauth/login/<provider>` → get `authorize_url`
2. Tell user: "Open this URL, authorize, then paste the full URL from the error page that appears"
3. Extract `code` and `state` from pasted URL
4. `curl -s "https://gateway-control/plugins/oauth/callback?code=<CODE>&state=<STATE>"`
5. Confirm with `/status/<provider>`

## Disconnect

```bash
curl -s https://gateway-control/plugins/oauth/disconnect/<provider>
```

## Error Handling

If 401, "needs-auth", or >10s hang: check `/status`, disconnect+reconnect if `expired: true`, or ask user to re-authorize.

## Notes

- All routes use `https://gateway-control/plugins/oauth/...` (NOT the provider host)
- The error page after authorization is expected — user copies the URL from the address bar
- Token refresh is automatic when `connected: true` and `expired: false`
