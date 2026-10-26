#!/bin/sh
# usage: ./run_claude.sh model n max   e.g. ./run_claude.sh haiku 76 100
# Appends "model,answer" lines to raw.csv next to this script.
# Fresh call each time, plain system prompt, no tools, run from an empty dir.
m=$1; n=$2; max=$3; out="$(cd "$(dirname "$0")" && pwd)/raw.csv"; d=$(mktemp -d)
cd "$d"
for i in $(seq 1 "$n"); do
  a=$(claude -p "Pick a random number between 1 and $max. Reply with the number only." --model "$m" --system-prompt "You are a helpful assistant." --tools "" 2>/dev/null | tr -dc '0-9' | head -c 5)
  echo "$m,$a" >> "$out"
done
