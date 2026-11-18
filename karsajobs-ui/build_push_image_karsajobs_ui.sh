#!/bin/bash
set -euo pipefail

# Validasi kredensial Docker Hub sebelum mulai
if [[ -z "${PASSWORD_DOCKER_HUB:-}" ]]; then
  echo "ERROR: variabel PASSWORD_DOCKER_HUB belum di-set." >&2
  exit 1
fi

IMAGE_NAME="dockerraihan27/karsajobs-ui:latest"

# Mendapatkan NODE_IP secara cross-platform (Linux/WSL & Windows Git Bash)
if hostname -I &>/dev/null; then
  NODE_IP=$(hostname -I | awk '{print $1}')
else
  NODE_IP=$(ipconfig 2>/dev/null | grep -i "IPv4" | head -n 1 | cut -d":" -f2 | tr -d ' \r')
fi

# Fallback jika IP kosong
if [ -z "${NODE_IP}" ]; then
  NODE_IP="localhost"
fi

BACKEND_URL="http://${NODE_IP}:30080"

echo "1. Membangun Docker image untuk frontend Karsa Jobs..."
docker build \
  --build-arg VUE_APP_BACKEND="${BACKEND_URL}" \
  -t "${IMAGE_NAME}" \
  .

echo "2. Melakukan login ke Docker Hub..."
echo "${PASSWORD_DOCKER_HUB}" | docker login -u dockerraihan27 --password-stdin

echo "3. Mengunggah (push) Docker image ke registry..."
docker push "${IMAGE_NAME}"

echo "Selesai! Image frontend berhasil di-push."