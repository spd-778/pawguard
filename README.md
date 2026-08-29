# 🐾 PawGuard — DevOps & SRE Platform

Cloud-native animal safety and rescue platform built on Google Cloud with Terraform, Docker, CI/CD, observability, and SRE practices.

## 🏗️ Architecture

                         GitHub
                            |
                            v
                    GitHub Actions
                       /       \
                      /         \
                     v           v
              Docker Build    Google OIDC
                     |             |
                     v             v
                    GHCR        GCP VM
                                  |
                           Docker Compose
                                  |
          +-----------------------+----------------------+
          |                       |                      |
          v                       v                      v
      PawGuard               Prometheus              Grafana
                                  |
                         +--------+--------+
                         |                 |
                         v                 v
                   Node Exporter       cAdvisor


## 🚀 Technology Stack

### Cloud

- Google Cloud Platform
- Google Compute Engine
- Terraform
- Workload Identity Federation

### Containers

- Docker
- Docker Compose
- Nginx

### CI/CD

- GitHub Actions
- GitHub Container Registry
- Immutable Docker images
- Automated deployment
- Health verification
- Deployment rollback

### Observability

- Prometheus
- Grafana
- Node Exporter
- cAdvisor

### SRE

- SLI/SLO
- Monitoring
- Alerting
- Incident response
- Runbooks
- Failure detection
- Recovery
- Rollback


## 🎯 SLOs

| SLO | Target |
|---|---:|
| Availability | 99.9% |
| CPU utilization | < 80% |
| Memory utilization | < 80% |
| Container health | Healthy |


## 📊 Observability

PawGuard uses a complete monitoring stack built with Prometheus, Grafana, Node Exporter, and cAdvisor.

### Monitored Areas

- Service availability
- Node CPU
- Node memory
- Container CPU
- Container memory
- PawGuard health
- Prometheus health
- Node Exporter health
- cAdvisor health

### Grafana Dashboard

The Grafana dashboard provides a centralized view of application and infrastructure health.

Dashboard panels include:

- PawGuard Availability
- Node CPU
- Node Memory
- Container CPU
- Container Memory
- Prometheus Health
- Node Exporter Health
- cAdvisor Health

- <img width="1710" height="993" alt="image" src="https://github.com/user-attachments/assets/0bdbf8b5-437f-4ca1-8b28-d34656e34e73" />
<img width="1710" height="993" alt="image" src="https://github.com/user-attachments/assets/c5aff600-1825-43bc-8325-27d3989e65f3" />
<img width="1710" height="1031" alt="image" src="https://github.com/user-attachments/assets/1c347c46-04f5-45c7-bea3-6cb27bf802b8" />





## 🚨 Alerting

Prometheus alerting is used to detect service degradation and infrastructure issues.

Configured alerts include:

- PawGuardDown
- NodeCPUHigh
- NodeMemoryHigh
- PawGuardContainerRestarting

A service outage is detected when the PawGuard Prometheus target becomes unavailable.
<img width="1710" height="993" alt="image" src="https://github.com/user-attachments/assets/2ff9ddac-e9e7-49ce-a271-1511774250bf" />
<img width="1710" height="1031" alt="image" src="https://github.com/user-attachments/assets/243d2079-0af0-4d75-be1e-00b15368fe45" />
<img width="1710" height="1031" alt="image" src="https://github.com/user-attachments/assets/2f193e19-8da2-4b24-b6f3-ed5a98273471" />
<img width="1710" height="1031" alt="image" src="https://github.com/user-attachments/assets/01c8eee8-1dd7-4630-9375-d633274914a6" />
<img width="1710" height="1031" alt="image" src="https://github.com/user-attachments/assets/cb236fa8-5601-40fa-9942-2a8bfbd08986" />
<img width="1710" height="1031" alt="image" src="https://github.com/user-attachments/assets/004a4ca3-036f-41bc-8f2e-acf5ed27b41d" />





## 🔄 CI/CD

Every push to the main branch triggers the automated CI/CD pipeline.

Git Push
   |
   v
GitHub Actions
   |
   v
Docker Build
   |
   v
Push Image to GHCR
   |
   v
Google OIDC Authentication
   |
   v
GCP Compute Engine
   |
   v
Docker Compose Deployment
   |
   v
Health Check
   |
   +------------------+
   |                  |
   v                  v
SUCCESS            FAILURE
   |                  |
   v                  v
Complete            Rollback
                      |
                      v
                Previous Image


### Immutable Images

Docker images are tagged using the Git commit SHA.

Example:

ghcr.io/spd-778/pawguard:<commit-sha>

This creates traceability between:

Git Commit → Docker Image → Production Deployment


## 🔐 Security

GitHub Actions authenticates to Google Cloud using Workload Identity Federation.

The deployment does not require a long-lived GCP service-account JSON key.

The workload identity configuration is restricted to the PawGuard GitHub repository:

spd-778/pawguard

Additional security controls include:

- Docker resource limits
- Container health checks
- Restart policies
- Log rotation
- Restricted monitoring access
- Immutable container images


## 🧯 Incident Response

PawGuard follows an SRE-oriented incident lifecycle.

Detect
  |
  v
Triage
  |
  v
Investigate
  |
  v
Mitigate
  |
  v
Recover
  |
  v
Verify
  |
  v
Document
  |
  v
Prevent Recurrence


### Incident Severity

SEV-1
Complete service outage.

SEV-2
Major service degradation.

SEV-3
Minor degradation with limited impact.


## 🔄 Deployment & Rollback

PawGuard uses immutable Docker images tied to Git commits.

Deployment flow:

Git Commit
    |
    v
Docker Build
    |
    v
Push to GHCR
    |
    v
Capture Previous Image
    |
    v
Deploy New Image
    |
    v
Health Check
    |
    +-------------------+
    |                   |
    v                   v
 Healthy             Unhealthy
    |                   |
    v                   v
 Complete            Rollback
                        |
                        v
                  Previous Image
                        |
                        v
                   Health Check


## 🏥 Application Health

The PawGuard container uses Docker health checks to verify that the application is responding correctly.

Health verification:

docker inspect pawguard-web --format='{{.State.Health.Status}}'

Expected status:

healthy

Application endpoint:

http://localhost:8080


## 📈 Monitoring Services

PawGuard uses the following services:

PawGuard
Application service.

Prometheus
Metrics collection and alerting.

Grafana
Metrics visualization and dashboards.

Node Exporter
Host-level infrastructure metrics.

cAdvisor
Docker container resource metrics.


## 🧪 Reliability Testing

The platform is designed to test:

- Container health
- HTTP availability
- Prometheus target availability
- Grafana monitoring
- Node resource usage
- Container resource usage
- Service failure detection
- Service recovery
- Automated deployments
- Immutable image deployments
- Rollback procedures


## 📚 Documentation

### Architecture

System Design:
architecture/system-design.md

Feature Mapping:
architecture/feature-mapping.md


### DevOps

Project Overview:
docs/project-overview.md

Deployment:
docs/deployment.md

Observability:
docs/observability.md

Security:
docs/security.md


### SRE

SLOs and SLIs:
sre/slos-slas.md

Incident Runbook:
sre/runbook.md

Incident Management:
sre/incident-management.md

Deployment Strategy:
sre/deployment-strategy.md


## 📁 Project Structure

pawguard/
|
├── .github/
│   └── workflows/
│       └── deploy.yml
|
├── architecture/
│   ├── system-design.md
│   └── feature-mapping.md
|
├── docs/
│   ├── deployment.md
│   ├── observability.md
│   ├── project-overview.md
│   └── security.md
|
├── monitoring/
│   ├── prometheus/
│   │   ├── prometheus.yml
│   │   └── alerts.yml
│   └── grafana/
|
├── scripts/
│   └── rollback.sh
|
├── sre/
│   ├── slos-slas.md
│   ├── runbook.md
│   ├── incident-management.md
│   └── deployment-strategy.md
|
├── terraform/
│
├── Dockerfile
├── docker-compose.yml
├── index.html
└── README.md


## 🛠️ Local Development

Clone the repository:

git clone https://github.com/spd-778/pawguard.git

Enter the project:

cd pawguard

Start the application:

docker compose up -d

Check running services:

docker compose ps

Stop services:

docker compose down


## 🔍 Useful Commands

Check PawGuard:

docker compose ps pawguard-web

View application logs:

docker compose logs --tail=100 pawguard-web

Check all logs:

docker compose logs --tail=100

Check resource usage:

docker stats

Check container health:

docker inspect pawguard-web --format='{{.State.Health.Status}}'


## ☁️ GCP Deployment

The production environment runs on Google Compute Engine.

Infrastructure is provisioned using Terraform.

The application is deployed using Docker Compose.

GitHub Actions performs automated deployments using Google Workload Identity Federation.


## 🎓 SRE Engineering Principles

This project demonstrates practical SRE and DevOps principles:

- Infrastructure as Code
- Automated CI/CD
- Immutable deployments
- Cloud infrastructure
- Containerization
- Observability
- Monitoring
- Alerting
- Health checks
- SLI/SLO design
- Incident response
- Failure detection
- Automated recovery
- Deployment rollback
- Least-privilege authentication
- Operational documentation


## 👩‍💻 Author

Prathyusha Danthuluri

DevOps / SRE Portfolio Project

GitHub:
https://github.com/spd-778/pawguard
