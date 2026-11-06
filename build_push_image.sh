#membuat Docker image dari Dockerfile dengan nama item-app, dan memiliki tag v1
docker build -t item-app:v1 .

#Melihat daftar image di lokal
docker images

#Mengubah nama image agar sesuai dengan format Docker
docker tag item-app:v1 dockerraihan27/item-app:v1

echo $PASSWORD_DOCKER_HUB | docker login -u dockerraihan27 --password-stdin
docker push dockerraihan27/item-app:v1