# PawGuard Observability

## Monitoring Stack

PawGuard uses:

- Prometheus
- Grafana
- Node Exporter
- cAdvisor

## Key Metrics

### Availability

up{job="pawguard"}

### CPU

100 - (avg by(instance) (rate(node_cpu_seconds_total{mode="idle"}[5m])) * 100)

### Memory

100 * (1 - node_memory_MemAvailable_bytes / node_memory_MemTotal_bytes)

## Grafana Dashboard

PawGuard SRE Observability

Panels:

- Service Availability
- Node CPU
- Node Memory
- Container CPU
- Container Memory
- PawGuard Health
- Prometheus Health
- Node Exporter Health
- cAdvisor Health
