#!/bin/bash
# Усі тести Nx IDE без вікна. Кожен сценарій - на новій тимчасовій теці й
# зі своїм файлом налаштувань (NYX_IDE_CONFIG), справжні не чіпаються.
#   bash tests/run_all.sh            (nx з PATH)
#   NX=/шлях/до/Nx bash tests/run_all.sh
cd "$(dirname "$0")/.."
NX="${NX:-nx}"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT
mkdir -p "$TMP/shots"
fail=0
run() {
    local name="$1"; shift
    mkdir -p "$TMP/cfg-$name"
    local out
    out=$(NYX_IDE_CONFIG="$TMP/cfg-$name/s.json" NX_HEADLESS=1 timeout 300 "$NX" "tests/$name" "$@" 2>&1)
    local ok; ok=$(echo "$out" | grep -c '^ok')
    if echo "$out" | grep -qE 'ПРОЙДЕНО|ГАРАЗД'; then
        echo "✅ $name ($ok перевірок)"
    else
        echo "❌ $name"; echo "$out" | tail -8; fail=1
    fi
}
run scenario_code.nx "$TMP/p1" "$TMP/shots"
run scenario_blocks.nx "$TMP/p2" "$TMP/shots"
run scenario_guide.nx "$TMP/p3" "$TMP/shots"
mkdir -p "$TMP/p4"
run test_blocks_model.nx "$TMP/p4"
run test_explain.nx
exit $fail
