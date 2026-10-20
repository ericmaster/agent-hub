# Agent Hub

Public catalog of portable custom agents for Agent Fabric. Hub agents are
content, not a task-system runtime. Keep dependencies explicit in
`hub.json`, avoid provider IDs, credentials, private URLs, and Company OS paths.

Validate with `scripts/validate.sh` before publishing.

## Documentation lifecycle

Keep specs and other non-ADR docs current-state only; do not use them as changelogs, timelines,
release notes, or historical change logs. Before release, ADRs may be edited, merged, or
squashed to retain the latest decision; after release, preserve published ADRs and record later
decisions in a new superseding ADR. Apply the `context-hygiene` skill before documentation or
spec writes; link each fact to its SSOT instead of duplicating it.
