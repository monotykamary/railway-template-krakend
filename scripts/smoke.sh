#!/bin/sh
set -eu
: "${BASE_URL:?Set BASE_URL}"
base=${BASE_URL%/}
health=$(curl -fsS "$base/__health")
printf '%s' "$health" | grep -qi 'ok'
demo=$(curl -fsS "$base/api/demo")
printf '%s' "$demo" | grep -q 'private Railway backend'
printf '%s' "$demo" | grep -q '"source":"echo"'
missing=$(curl -sS -o /dev/null -w '%{http_code}' "$base/api/missing")
[ "$missing" = "404" ]
printf '%s\n' 'KrakenD smoke checks passed'
