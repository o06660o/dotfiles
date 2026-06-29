#!/usr/bin/env bash
set -euo pipefail
cd -- "$(dirname -- "${BASH_SOURCE[0]}")"

update() {
  echo "Updating Flake Lock."
  nix flake update --flake .
}

rebuild() {
  echo "Rebuilding Home Manager Generations."
  home-manager switch --flake ".#$USER"
}

case "${1:-}" in
update)
  update
  ;;
rebuild)
  rebuild
  ;;
*)
  echo "Usage: $0 [update|rebuild]" >&2
  exit 1
  ;;
esac
