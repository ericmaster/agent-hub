# Agent Hub

Public catalog of portable custom agents for Agent Fabric. Hub agents are
content, not a task-system runtime. Keep dependencies explicit in
`hub.json`, avoid provider IDs, credentials, private URLs, and Company OS paths.

Validate with `scripts/validate.sh` before publishing.

## Documentation lifecycle

Keep specs and non-ADR docs current-state only, except `CHANGELOG.md`, the release-history SSOT.
Collect pending changes under `[Unreleased]`, preserve published release entries, and group them
by actual version and release date; never invent prior releases. ADRs own decision rationale:
before release they may be edited, merged, or squashed; after release preserve published ADRs
and record later decisions in a new ADR with `supersedes`. Apply `context-hygiene` before
documentation or spec writes; link to the owning SSOT rather than duplicating it. Git and Plane
own commit and work-item detail.
