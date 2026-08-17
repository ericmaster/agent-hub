# Spec: docs/specs/agent-hub.md
from pathlib import Path
import json


ROOT = Path(__file__).parents[1]


def test_hub_dependencies_resolve_without_private_paths():
    data = json.loads((ROOT / "hub.json").read_text())
    fabric = {"planner", "code-reviewer", "expert-debugger", "implementor", "loop-supervisor", "plan-reviewer", "plan-supervisor", "qa-runner"}
    for agent_id, metadata in data["agents"].items():
        assert (ROOT / "agents" / f"{agent_id}.md").exists()
        assert set(metadata.get("requires", [])) <= set(data["agents"]) | fabric
        text = (ROOT / "agents" / f"{agent_id}.md").read_text()
        assert "NIMBLER_OPS_HOME" not in text
        assert "/home/" not in text
        assert "plane-mcp" not in text


def test_simplification_planner_requires_planner():
    data = json.loads((ROOT / "hub.json").read_text())
    assert data["agents"]["simplification-planner"]["requires"] == ["planner"]
