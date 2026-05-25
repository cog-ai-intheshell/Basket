#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PYTHON_BIN="${PYTHON:-$ROOT_DIR/.venv/bin/python}"

if [[ ! -x "$PYTHON_BIN" ]]; then
  PYTHON_BIN="$(command -v python3)"
fi

cd "$ROOT_DIR"
exec "$PYTHON_BIN" -m server.server \
  --model-dir "${BASKET_WORLD_MODEL_DIR:-model/artifacts/world_model}" \
  --momentum-model "${BASKET_MOMENTUM_MODEL:-model/artifacts/momentum_xgb/momentum_xgb.json}" \
  --host "${BASKET_SERVER_HOST:-127.0.0.1}" \
  --port "${BASKET_SERVER_PORT:-8765}" \
  "$@"
