---
name: cloud-management
description: Cross-cloud CLI-first cloud operations for AWS, Azure, and GCP. Use when Codex needs to identify which cloud provider or multi-cloud estate a repo uses, deploy new resources or services, wire automatic deployments, inventory and optimize infrastructure, or diagnose and repair cloud failures entirely from the terminal, with explicit approval gates for high-cost, destructive, identity-sensitive, or hard-to-reverse changes.
---

# Cloud Management

Operate AWS, Azure, and GCP from the terminal as the control plane. Use provider CLIs plus terminal-invoked tools such as `docker`, `terraform`, `pulumi`, `kubectl`, `helm`, and CI runners. Do not fall back to a portal unless the user explicitly asks for a console workflow.

## Non-Negotiables

1. Start read-only. Inspect the repo, current provider scope, existing IaC, and deployed state before proposing writes.
2. Treat cloud as a set of concerns, not a single logo. Runtime, database, storage, DNS, secrets, and observability may live on different providers.
3. Use CLI-only execution. Prefer `aws`, `az`, and `gcloud`, plus CLI-driven IaC or deployment tools already present in the repo.
4. Reuse the existing state manager. Extend Terraform, Bicep, CloudFormation, Pulumi, Helm, or repo-owned deploy scripts instead of creating a parallel path.
5. Default to the simplest managed service that fits the workload. Favor managed containers, managed databases, and managed queues over VMs or Kubernetes unless the repo already needs lower-level control.
6. Default to cost-conscious dev sizing unless the user explicitly asks for production-ready HA, multi-region, or higher compliance posture.
7. Require explicit approval before high-cost, destructive, public-ingress, org-scope, identity-sensitive, or hard-to-reverse changes.
8. Prefer short-lived credentials, SSO, managed identity, workload identity, or OIDC federation over static keys.
9. When a command surface is uncertain, inspect `--help`, provider docs, or existing repo automation before guessing.
10. Finish the loop: apply, verify, capture outputs, and record rollback posture.

## Start Sequence

1. Run `python .agents/skills/cloud-management/scripts/detect_repo_stack.py .` from the repo root.
2. Read [cli-operating-model.md](./references/cli-operating-model.md) for the shared operating discipline.
3. Load only the references needed for the task:
   - mixed-cloud selection and workload mapping: [provider-selection.md](./references/provider-selection.md)
   - approval gates and cost risk: [approval-policy.md](./references/approval-policy.md)
   - CI/CD and automatic deployments: [cicd-and-auto-deploy.md](./references/cicd-and-auto-deploy.md)
   - inventory, optimization, and incident repair: [inventory-optimization-remediation.md](./references/inventory-optimization-remediation.md)
   - provider-specific command runbooks:
     - [aws-cli-playbook.md](./references/aws-cli-playbook.md)
     - [azure-cli-playbook.md](./references/azure-cli-playbook.md)
     - [gcp-cli-playbook.md](./references/gcp-cli-playbook.md)
4. Verify provider scope before any write:
   - AWS: profile or role, account, region
   - Azure: cloud, tenant, subscription, resource group
   - GCP: configuration, account, project, enabled APIs
5. For any non-trivial mutation, run the guard script before presenting or executing the change:

```bash
python .agents/skills/cloud-management/scripts/cloud_change_guard.py \
  --provider aws \
  --environment prod \
  --operation "create ecs service, alb, and rds postgres instance" \
  --resource-type database \
  --monthly-cost-usd 180 \
  --stateful \
  --public-ingress \
  --dns-change \
  --format markdown
```

## Shared Execution Loop

Use this loop for every cloud task:

1. Discover: inspect repo shape, existing infra ownership, and live cloud state.
2. Decide: choose the least-complex provider-native mapping that fits the workload and current estate.
3. Preview: validate templates, inspect diffs, or run dry-run and what-if surfaces where available.
4. Approve: request permission when cost, blast radius, identity, ingress, data, or rollback risk justifies it.
5. Apply: execute exact CLI or CLI-driven IaC commands.
6. Verify: wait for health, deployment status, logs, revisions, and connectivity.
7. Record: capture outputs, rollback path, and any follow-up risks.

## Task Router

### Identify the Right Provider or Multi-Cloud Shape

1. Use `detect_repo_stack.py` to infer frameworks, CI, IaC, cloud hints, and likely runtime bias.
2. Load [provider-selection.md](./references/provider-selection.md).
3. Determine ownership by concern:
   - runtime
   - data
   - storage
   - registry
   - secrets
   - DNS and CDN
   - CI identity
4. Preserve existing systems of record unless the user explicitly wants migration or consolidation.

### Deploy New Resources or Services

1. Infer the workload shape and choose the least-complex managed target.
2. Estimate recurring and one-time cost before provisioning.
3. Run `cloud_change_guard.py` and request approval if required.
4. Prefer the repo's existing IaC path. If none exists, use the provider CLI or CLI-invoked IaC in the smallest reasonable footprint.
5. Wait, verify, and return the exact endpoints, IDs, and health evidence.

### Wire Automatic Deployments

1. Reuse the existing CI system when it exists.
2. Prefer OIDC, federated credentials, managed identity, or workload identity for CI-to-cloud auth.
3. Build immutable artifacts once, publish them to the provider registry, then roll out by reference.
4. Split infra deploys from runtime deploys when stateful resources or migrations are involved.
5. Load [cicd-and-auto-deploy.md](./references/cicd-and-auto-deploy.md).

### Inventory and Optimize

1. Inventory first with list, describe, graph, asset, billing, and deployment-state commands.
2. Review each layer independently: compute, ingress, database, cache, storage, identity, logging, and spend.
3. Look for obvious waste before redesign:
   - idle or duplicate resources
   - oversized data tiers
   - always-on non-prod capacity
   - needless NAT, egress, or public ingress
   - missing lifecycle rules, autoscaling, or concurrency limits
4. Load [inventory-optimization-remediation.md](./references/inventory-optimization-remediation.md).

### Diagnose and Fix Cloud Errors

1. Confirm provider scope and environment.
2. Reproduce or isolate the failing surface.
3. Inspect deployment history, logs, events, identity, secrets, network, and dependencies.
4. Prefer the smallest reversible change first.
5. Re-verify service health, rollout status, and rollback readiness.
6. Capture the root cause and the exact corrective command sequence.

## Architecture Bias

Favor the simplest managed platform that fits the repo:

- Static site or SPA: storage plus CDN, or the provider's lightweight static hosting path.
- Containerized API: ECS Fargate, Azure Container Apps, or Cloud Run before Kubernetes.
- Web plus worker plus websocket or realtime: split services by responsibility instead of forcing one long-running process shape.
- Event-driven jobs or schedulers: use provider-native schedulers and queues instead of cron inside app containers.
- Kubernetes: choose only when the repo already needs k8s primitives, advanced ingress, sidecars, daemon workloads, or node-level tuning.

For Cloush-style backends, use this as the baseline example, not a hard requirement:

- separate `web`, `worker`, and `socket` or `realtime` runtime surfaces
- managed PostgreSQL, managed Redis or Valkey, object storage, registry, and secrets
- provider-native schedulers and queues
- registry push plus rolling or revision-based service updates, not hand-managed VMs

## Approval Model

Always request explicit permission before:

- deleting, replacing, migrating, restoring, or resizing stateful resources
- changing DNS, TLS, public ingress, private networking, or auth trust
- creating likely expensive services such as HA databases, premium caches, NAT gateways, large load balancers, dedicated clusters, or cross-region replication
- changing org-scope policy, IAM, RBAC, or workload identity bindings
- performing production changes with downtime or restart risk

Use `cloud_change_guard.py` to classify risk and generate the checklist or approval request. Read [approval-policy.md](./references/approval-policy.md) for the full model.

## Bundled Scripts

- `scripts/detect_repo_stack.py`
  - Inspect a repo and emit deploy-relevant signals: languages, frameworks, CI, IaC, cloud hints, identity hints, and recommended runtime bias.
- `scripts/cloud_change_guard.py`
  - Score change risk, determine whether approval is required, and emit a structured checklist or approval template before execution.
