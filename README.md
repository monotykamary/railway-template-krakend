# KrakenD on Railway

[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/deploy/krakend-gateway?referralCode=ZqgrJ0)

Deploy KrakenD Community Edition 2.13.8 with a working private backend example and a version-controlled gateway configuration.

The Deploy on Railway button is added after the published route is verified.

## What this deploys

- Public KrakenD CE `2.13.8`, pinned to the official Linux/AMD64 image digest
- Private Caddy `2.10.2-alpine` echo backend, pinned by digest
- A validated `/api/demo` gateway route and KrakenD's built-in `/__health`
- Per-client and global gateway rate limits
- Upstream anonymous usage reporting disabled

## Try it

```bash
curl https://your-domain.example/api/demo
```

The response comes through KrakenD from the private `echo` service. `/api/missing` returns 404, and the echo service has no public domain.

## Customize the gateway

Edit `gateway/krakend.template.json` in your fork to replace the demo endpoint with real APIs. Keep backend services private and inject service addresses through Railway reference variables rather than hardcoding deployment-specific domains.

The adapter validates `BACKEND_URL`, renders the runtime file, runs `krakend check`, and only then starts the gateway. Configuration changes therefore fail at deployment instead of silently serving a partial gateway.

## Scope

This is an intentionally small starter topology, not a preconfigured production API estate. It demonstrates private service discovery, aggregation, health, and rate limiting. Add authentication, request validation, observability, cache, and product-specific policies required by your APIs before production use.

## Updating

Update KrakenD and Caddy tags and immutable digests together, review configuration migrations, then repeat config validation, backend routing, negative paths, rate limiting, logs, and redeploy soak tests.

## Validation

```bash
npm test
BASE_URL=https://your-domain.example ./scripts/smoke.sh
```

## Upstream

- Source: https://github.com/krakend/krakend-ce/tree/v2.13.8
- Release: https://github.com/krakend/krakend-ce/releases/tag/v2.13.8
- Documentation: https://www.krakend.io/docs/
- License: Apache License 2.0

This repository contains Railway adapters and example configuration. KrakenD remains copyright KrakenD contributors and is not affiliated with Railway.
