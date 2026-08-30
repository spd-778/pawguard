# PawGuard SLOs and SLIs

## Availability SLO

Target: 99.9% monthly availability.

SLI:
- HTTP service availability
- Prometheus `up` metric

Objective:
- PawGuard should remain available for at least 99.9% of the measurement window.

## Infrastructure SLO

Target: CPU utilization below 80% during normal operation.

SLI:
- Node CPU utilization

## Memory SLO

Target: Memory utilization below 80% during normal operation.

SLI:
- Node memory utilization

## Container SLO

Target: PawGuard container remains healthy.

SLI:
- Docker/container health status
- Prometheus availability metric

## Alerting Principles

Alerts should represent actionable failures rather than normal fluctuations.

Severity:
- Critical: service unavailable
- Warning: resource utilization approaching threshold
