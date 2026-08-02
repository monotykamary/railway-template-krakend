# Deploy and Host KrakenD on Railway

## About Hosting KrakenD

KrakenD Community Edition is a high-performance stateless API gateway. This template deploys stable version 2.13.8 with a working private echo backend so the gateway path can be tested immediately and then replaced with your own APIs.

## Common Use Cases

- Route a public API to private Railway services
- Aggregate and transform backend responses
- Apply gateway rate limits and transport policies
- Maintain API gateway configuration in Git

## Dependencies for KrakenD Hosting

### Deployment Dependencies

- Public KrakenD gateway
- Private Caddy echo backend used as a replaceable example
- No database or persistent volume

### Implementation Details

Railway HTTPS routes to KrakenD on port 8080. `BACKEND_URL` references the private echo service on port 8081. The adapter renders a runtime configuration, validates it with `krakend check`, and starts only when the full file is valid. `/api/demo` proves end-to-end private routing; `/__health` supplies readiness.

The included rate limits and demo route are a starter, not a complete production security policy. Fork the repository and update `gateway/krakend.template.json` for your real APIs.

## Why Deploy KrakenD on Railway?

Railway provides managed HTTPS, private DNS, health checks, Git-based configuration deployment, and repeatable gateway rollouts without exposing backend services publicly.
