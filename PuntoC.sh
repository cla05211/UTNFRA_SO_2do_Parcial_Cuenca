
vim index.html
mkdir web
move index.html web/
mv index.html web/
vim Dockerfile
sudo mv Dockerfile docker/
sudo docker build -t web1-cuenca .
sudo fdisk /dev/sdd
sudo pvcreate /dev/sdd5
sudo vgextend vg_datos /dev/sdd5
sudo lvextend -l +100%FREE /dev/mapper/vg_datos-lv_docker
sudo resize2fs /dev/mapper/vg_datos-lv_docker
sudo docker build -t web1-cuenca .
docker run -d -p 80:80 web1-cuenca:v1
sudo docker build -t web1-cuenca:v1 .
docker tag web1-cuenca:v1 cla05211/web1-cuenca:v1
docker push cla05211/web1-cuenca:v1

