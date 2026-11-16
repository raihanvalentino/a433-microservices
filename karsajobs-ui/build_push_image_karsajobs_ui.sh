#!/bin/bash
set -e

IMAGE_NAME="dockerraihan27/karsajobs-ui:latest"
BACKEND_URL="http://localhost:30080"

echo "1. Membangun Docker image untuk frontend Karsa Jobs UI..."
docker build --build-arg VUE_APP_BACKEND=$BACKEND_URL -t $IMAGE_NAME .

echo "2. Melakukan login ke Docker Hub..."
echo $PASSWORD_DOCKER_HUB | docker login -u dockerraihan27 --password-stdin

echo "3. Mengunggah (push) Docker image ke registry..."
docker push $IMAGE_NAME

echo "Selesai! Image frontend berhasil di-push."