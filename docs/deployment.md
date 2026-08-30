# PawGuard Deployment

## Application

PawGuard runs as a Docker container on Google Compute Engine.

## Docker Compose

Start:

docker compose up -d

Check:

docker compose ps

## CI/CD

Pushes to main trigger GitHub Actions.

Pipeline:

Git Push
  |
  v
GitHub Actions
  |
  v
Docker Build
  |
  v
GHCR
  |
  v
Google OIDC
  |
  v
GCP VM
  |
  v
Docker Compose
  |
  v
Health Check

## Application Health

curl -I http://localhost:8080

Expected:

HTTP 200
