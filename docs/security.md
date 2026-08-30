# PawGuard Security

## GitHub Authentication

GitHub Actions authenticates to Google Cloud using Workload Identity Federation.

No long-lived service-account JSON key is stored in GitHub.

## Repository Restriction

The workload identity binding is restricted to:

spd-778/pawguard

## Container Controls

PawGuard uses:

- Resource limits
- Health checks
- Restart policies
- Log rotation

## Network Security

Only required application access should be publicly exposed.

Prometheus, Grafana, cAdvisor and Node Exporter should be restricted to trusted access paths.
