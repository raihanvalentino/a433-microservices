#!/bin/bash
NODE_IP=$(hostname -I | awk '{print $1}')
BACKEND_URL="http://${NODE_IP}:30080"

docker build --build-arg VUE_APP_BACKEND=$BACKEND_URL -t dockerraihan27/karsajobs-ui:latest .
docker push dockerraihan27/karsajobs-ui:latest

echo "2. Melakukan login ke Docker Hub..."
echo $PASSWORD_DOCKER_HUB | docker login -u dockerraihan27 --password-stdin
    
echo "3. Mengunggah (push) Docker image ke registry..."
docker push $IMAGE_NAME

echo "Selesai Image frontend berhasil di-push."