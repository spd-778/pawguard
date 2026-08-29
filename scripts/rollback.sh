#!/usr/bin/env bash
set -euo pipefail

cd "$HOME/pawguard"

SERVICE="pawguard-web"
COMPOSE_FILE="docker-compose.yml"

echo "===== PAWGUARD ROLLBACK ====="

CURRENT_IMAGE=$(docker inspect "$SERVICE" \
  --format='{{.Config.Image}}')

echo "Current image: $CURRENT_IMAGE"

PREVIOUS_IMAGE=$(cat .previous-image 2>/dev/null || true)

if [ -z "$PREVIOUS_IMAGE" ]; then
  echo "ERROR: No previous image recorded."
  echo "Rollback cannot continue."
  exit 1
fi

echo "Previous image: $PREVIOUS_IMAGE"

echo "$CURRENT_IMAGE" > .failed-image

sed -i "s|image: ghcr.io/spd-778/pawguard:.*|image: ${PREVIOUS_IMAGE}|" "$COMPOSE_FILE"

docker compose pull "$SERVICE"
docker compose up -d "$SERVICE"

echo "Waiting for health..."
sleep 30

HEALTH=$(docker inspect "$SERVICE" \
  --format='{{.State.Health.Status}}')

echo "Health: $HEALTH"

if [ "$HEALTH" != "healthy" ]; then
  echo "ROLLBACK FAILED"
  docker compose logs --tail=50 "$SERVICE"
  exit 1
fi

if ! curl -fsS http://localhost:8080 > /dev/null; then
  echo "HTTP verification failed."
  exit 1
fi

echo "$PREVIOUS_IMAGE" > .current-image

echo ""
echo "===== ROLLBACK SUCCESSFUL ====="
echo "Running image:"
docker inspect "$SERVICE" --format='{{.Config.Image}}'
