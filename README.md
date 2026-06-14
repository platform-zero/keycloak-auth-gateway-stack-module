# keycloak-auth-gateway stack module

- Module id: `keycloak-auth-gateway`
- Module repo: `keycloak-auth-gateway-stack-module`
- Source repo: none declared
- Lifecycle: `active`

## Owned overlays
- `stack.compose/keycloak-auth-gateway.yml`

## Dependencies
- `keycloak`
- `stack-foundation`

## Validation

```sh
./tests/validate.sh
```

## Lifecycle

`active` modules are expected to keep `stack.module.json`, owned overlays, and `tests/validate.sh` in sync.
