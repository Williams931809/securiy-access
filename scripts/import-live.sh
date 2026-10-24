#!/usr/bin/env bash
set -euo pipefail
url="https://residence.hamthelholdings.com/"
curl --fail --location --silent --show-error --retry 3 --max-time 45 "$url" -o index.html
test "$(wc -c < index.html)" -gt 20000
grep -qi '<title>H Access</title>' index.html
grep -qi 'supabase' index.html
printf 'Imported %s bytes into index.html\n' "$(wc -c < index.html)"
printf 'Review changes before committing or deploying.\n'
