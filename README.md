# Agent Hub

Agent Hub is the public catalog for portable custom agents that extend Agent
Fabric. It initially ships `mr-meeseeks` and `simplification-planner`.

```sh
git clone https://github.com/ericmaster/agent-hub
agf hub install ./agent-hub --yes
```

Hub definitions use the same canonical Markdown contract as Fabric. Their
filename is their identity, `hooks` frontmatter registers required hook events,
and `x-agent-fabric` declares logical policy and
dependencies. `simplification-planner` requires the Fabric `planner` agent;
installation validates the full dependency graph and rejects name collisions
before writing. Private task systems, provider adapters, credentials, and
Company OS paths belong outside this repository. Missing provider capability is
reported as `CAPABILITY_UNAVAILABLE` while local artifacts are preserved.

Use a local checkout, GitHub URL, or release tarball as the `hub install` source.
Public bootstrap never fetches private hub content.
