#!/usr/bin/env bash
set -euo pipefail
repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd -P)"
validator="${WEBSERVICES_MODULE_CONTRACT_VALIDATOR:-}"
if [ -z "$validator" ]; then
  for candidate in     "$repo_root/../../sso-stack-generator/scripts/modules/module-contract.sh"     "$repo_root/../sso-stack-generator/scripts/modules/module-contract.sh"; do
    if [ -x "$candidate" ]; then
      validator="$candidate"
      break
    fi
  done
fi
[ -n "$validator" ] || { printf '[module-contract] set WEBSERVICES_MODULE_CONTRACT_VALIDATOR or keep sso-stack-generator next to modules workspace\n' >&2; exit 1; }
grep -Fq "HULY_OPENID_CLIENT_SECRET: \"\${HULY_OPENID_CLIENT_SECRET:-}\"" "$repo_root/stack.runtime.yaml" || {
  printf '[module-contract] Keycloak setup must receive the Huly OIDC client secret\n' >&2
  exit 1
}
exec "$validator" contract "$repo_root"
