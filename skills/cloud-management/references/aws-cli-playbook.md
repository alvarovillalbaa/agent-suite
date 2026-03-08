# AWS CLI Playbook

## Contents

- Scope and identity
- Command habits
- Discovery and inventory
- Deploy and provision
- Automatic deployments
- Troubleshooting
- Optimization
- Cloush-style mapping

## Scope and Identity

Use profiles and regions explicitly. Verify scope before writes:

```bash
aws configure sso
aws sso login --profile my-dev
aws sts get-caller-identity --profile my-dev
aws configure list --profile my-dev
```

Prefer IAM Identity Center or other short-lived credentials over long-lived user keys. Use `AWS_PROFILE` or `--profile` deliberately in multi-account work.

## Command Habits

- Read first with `list-*`, `describe-*`, or `get-*`.
- Use `--profile`, `--region`, `--query`, and `--output table|json`.
- Inspect help with `aws help`, `aws <service> help`, or `aws <service> <command> help`.
- Prefer waiters over `sleep`.
- Use pagination controls such as `--page-size` or `--max-items` when large list calls are slow or noisy.
- Use `--generate-cli-skeleton` plus `--cli-input-json` for complex write operations when precision matters.
- Prefer CLI-driven IaC for repeatable infrastructure: `aws cloudformation deploy` or the repo's Terraform or Pulumi path.

## Discovery and Inventory

### Core Inventory

```bash
aws ec2 describe-instances --profile my-dev
aws ecs list-clusters --profile my-dev
aws ecs list-services --cluster app --profile my-dev
aws rds describe-db-instances --profile my-dev
aws elasticache describe-cache-clusters --profile my-dev
aws ecr describe-repositories --profile my-dev
aws s3 ls --profile my-dev
aws cloudformation list-stacks --profile my-dev
aws logs describe-log-groups --profile my-dev
```

### Output Shaping

```bash
aws ec2 describe-instances \
  --filters "Name=instance-state-name,Values=running" \
  --query "Reservations[].Instances[].{Id:InstanceId,Type:InstanceType,AZ:Placement.AvailabilityZone}" \
  --output table \
  --profile my-dev
```

### Cost and Governance

```bash
aws ce get-cost-and-usage \
  --time-period Start=2026-03-01,End=2026-03-31 \
  --granularity MONTHLY \
  --metrics UnblendedCost \
  --profile my-dev
aws iam list-roles --profile my-dev
aws organizations list-accounts --profile my-dev
```

## Deploy and Provision

### Default Managed Mapping

- registry: ECR
- runtime: ECS Fargate
- ingress: ALB
- data: RDS
- cache or broker: ElastiCache
- storage: S3
- secrets: Secrets Manager or Parameter Store

### Container Runtime Rollout

```bash
aws ecr get-login-password --region eu-west-1 --profile my-dev | \
  docker login --username AWS --password-stdin <account>.dkr.ecr.eu-west-1.amazonaws.com
docker build -t my-app:sha-123 .
docker tag my-app:sha-123 <account>.dkr.ecr.eu-west-1.amazonaws.com/my-app:sha-123
docker push <account>.dkr.ecr.eu-west-1.amazonaws.com/my-app:sha-123
aws ecs update-service \
  --cluster app \
  --service web \
  --force-new-deployment \
  --profile my-dev
aws ecs describe-services --cluster app --service web --profile my-dev
```

### Static Sites

```bash
aws s3 sync ./dist s3://my-site-bucket --delete --profile my-dev
aws cloudfront create-invalidation \
  --distribution-id DIST_ID \
  --paths '/*' \
  --profile my-dev
```

### Declarative Infrastructure

```bash
aws cloudformation deploy \
  --template-file infra.yaml \
  --stack-name my-stack \
  --capabilities CAPABILITY_NAMED_IAM \
  --profile my-dev
aws cloudformation describe-stack-events --stack-name my-stack --profile my-dev
```

### Data and Secret Setup

- RDS before app rollout if the service is stateful
- ElastiCache before workers if queues or cache are required
- Secrets Manager or Parameter Store before task definition updates
- Route53 and ACM only behind approval when public ingress changes

## Automatic Deployments

Preferred pattern:

- CI uses OIDC to assume an IAM role
- CI builds and pushes to ECR
- CI deploys via `aws cloudformation deploy`, `aws ecs update-service`, or `aws lambda update-function-code`
- CI verifies rollout via ECS, CloudFormation, ALB, and CloudWatch surfaces

Useful command surfaces:

- `aws sts get-caller-identity`
- `aws iam get-role`
- `aws ecr describe-repositories`
- `aws ecs register-task-definition`
- `aws ecs update-service`
- `aws lambda update-function-code`

## Troubleshooting

### ECS and ALB

```bash
aws ecs describe-services --cluster app --service web --profile my-dev
aws ecs list-tasks --cluster app --service-name web --profile my-dev
aws ecs describe-tasks --cluster app --tasks <task-id> --profile my-dev
aws elbv2 describe-target-health --target-group-arn <tg-arn> --profile my-dev
aws logs tail /aws/ecs/my-app --follow --profile my-dev
```

### Infrastructure

```bash
aws cloudformation describe-stack-events --stack-name my-stack --profile my-dev
aws cloudformation detect-stack-drift --stack-name my-stack --profile my-dev
```

### Data and Identity

```bash
aws rds describe-db-instances --db-instance-identifier my-db --profile my-dev
aws secretsmanager list-secrets --profile my-dev
aws iam simulate-principal-policy --policy-source-arn <role-arn> --action-names ecs:UpdateService --profile my-dev
```

Common failure classes:

- wrong profile or region
- task definition references a missing image tag or secret
- ECS tasks cannot reach RDS, Redis, or ALB targets
- CloudFormation stack is blocked by IAM or immutable-resource constraints

## Optimization

- right-size ECS task CPU and memory from CloudWatch metrics
- remove idle ALBs, NAT gateways, or Elastic IPs
- review RDS class, storage, backup retention, and multi-AZ need
- review ElastiCache node size and always-on non-prod caches
- add S3 lifecycle and reduce unnecessary retention
- use VPC endpoints when egress or NAT cost is the problem

## Cloush-Style AWS Mapping

- `web`: ECS Fargate service behind ALB
- `worker`: ECS Fargate service without public ingress
- `socket`: ECS Fargate service with websocket-friendly ingress
- `db`: RDS PostgreSQL
- `cache`: ElastiCache Redis or Valkey
- `files`: S3
- `secrets`: Secrets Manager
- `scheduler`: EventBridge
