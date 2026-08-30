# PawGuard Deployment Strategy

## Immutable Images

Production images are tagged using Git commit SHA.

Example:

ghcr.io/spd-778/pawguard:<commit-sha>

This provides traceability:

Git Commit
    |
    v
Docker Image
    |
    v
Production Deployment

## Deployment Flow

Git Push
   |
   v
Build
   |
   v
Push to GHCR
   |
   v
Capture Previous Image
   |
   v
Deploy New SHA
   |
   v
Health Check
   |
   +---- Healthy ----> Complete
   |
   +---- Failed -----> Rollback
