# Agent Hub Specification

Hub agents are portable Agent Fabric definitions. Each file has a required
description and schema version 1 `x-agent-fabric` block. `hub.json` is the
dependency manifest; dependency IDs must be valid Fabric or hub IDs and are
resolved before installation. A collision is a hard pre-write error.

Hub content may describe generic hook events and trace fallback behavior, but
must not encode provider IDs, credentials, private URLs, or private filesystem
paths.
