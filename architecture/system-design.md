# PawGuard System Design

## High-Level Architecture

GitHub
  |
  v
GitHub Actions
  |
  +----> Docker Build ----> GHCR
  |
  +----> Google OIDC ----> GCP
                              |
                              v
                         Compute Engine
                              |
                         Docker Compose
                              |
          +-------------------+-------------------+
          |                   |                   |
          v                   v                   v
      PawGuard           Prometheus            Grafana
                              |
                    +---------+---------+
                    |                   |
                    v                   v
              Node Exporter         cAdvisor

## Components

### PawGuard
Containerized web application served through Nginx.

### Prometheus
Collects application and infrastructure metrics.

### Grafana
Provides monitoring dashboards and visualization.

### Node Exporter
Provides host-level CPU, memory and system metrics.

### cAdvisor
Provides Docker container metrics.

### GitHub Actions
Builds Docker images and deploys them to GCP.

### GHCR
Stores Docker images tagged with Git commit SHA.

### GCP Compute Engine
Hosts the production Docker Compose stack.

## Network

Services communicate using the Docker pawguard bridge network.
