#!/usr/bin/env bash
# Spec: docs/specs/agent-hub.md
set -euo pipefail
root="$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)"
python3 - "$root" <<'PY'
import json
import pathlib
import sys

root = pathlib.Path(sys.argv[1])
data = json.loads((root / "hub.json").read_text())
ids = set(data["agents"])
fabric = {"planner", "code-reviewer", "expert-debugger", "implementor", "loop-supervisor", "plan-reviewer", "plan-supervisor", "qa-runner"}
for agent_id, meta in data["agents"].items():
    if not (root / "agents" / f"{agent_id}.md").exists():
        raise SystemExit(f"missing definition: {agent_id}")
    for dependency in meta.get("requires", []):
        if dependency not in ids | fabric:
            raise SystemExit(f"missing dependency: {agent_id} -> {dependency}")
    text = (root / "agents" / f"{agent_id}.md").read_text()
    private_markers = ("NIMBLER_" + "OPS_HOME", "/home/", "plane-" + "mcp")
    if any(marker in text for marker in private_markers):
        raise SystemExit(f"private coupling in {agent_id}")
print(f"valid: {len(ids)} hub agents")
PY
