#!/bin/sh
set -eu
: "${BACKEND_URL:?BACKEND_URL is required}"
if ! printf '%s' "$BACKEND_URL" | grep -Eq '^http://[A-Za-z0-9.-]+:[0-9]+$'; then
  echo "BACKEND_URL must be an internal http URL with an explicit port" >&2
  exit 1
fi
sed "s|__BACKEND_URL__|$BACKEND_URL|g" /etc/krakend/krakend.template.json > /tmp/krakend.json
krakend check -c /tmp/krakend.json
exec krakend run -c /tmp/krakend.json
