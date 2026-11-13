#!/bin/bash
set -e

IMAGE_NAME="dockerraihan27/karsajobs:latest"

echo "1. Membangun Docker image untuk backend Karsa Jobs..."
docker build -t $IMAGE_NAME .

echo "2. Melakukan login ke Docker Hub..."
echo $PASSWORD_DOCKER_HUB | docker login -u dockerraihan27 --password-stdin

echo "3. Mengunggah (push) Docker image ke registry..."
docker push $IMAGE_NAME

echo "Selesai! Image backend berhasil di-push."