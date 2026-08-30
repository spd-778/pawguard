# PawGuard Incident Runbook

## PawGuard Down

### Detection

Prometheus alert:

PawGuardDown

### Investigation

docker compose ps

docker compose logs --tail=100 pawguard-web

Check targets:

curl -s http://localhost:9090/api/v1/targets

### Recovery

docker compose restart pawguard-web

Verify:

curl -I http://localhost:8080

Check health:

docker inspect pawguard-web --format='{{.State.Health.Status}}'

Expected:

healthy

## High CPU

docker stats

Review recent deployments and application activity.

## High Memory

docker stats
free -h

## Post-Incident

Record:

- Detection time
- Impact
- Timeline
- Root cause
- Mitigation
- Recovery
- Preventive action
