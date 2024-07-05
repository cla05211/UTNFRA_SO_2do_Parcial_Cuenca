sudo fdisk /dev/sdc
sudo fdisk /dev/sdd
sudo pvcreate /dev/sdc1
sudo pvcreate /dev/sdc2
sudo vgcreate vg_datos /dev/sdc1 /dev/sdc1 
sudo vgcreate vg_datos /dev/sdc1 /dev/sdc2
sudo vgcreate vg_temp /dev/sdd1 
sudo lvcreate –L +5M vg_datos –n lv_docker
sudo lvcreate -l +100%FREE vg_datos -n lv_workareas
sudo lvcreate -l +100%FREE vg_temp -n lv_swap
sudo mkswap /dev/mapper/vg_temp-lv_swap
sudo mkfs.ext4 /dev/mapper/vg_datos-lv_docker
sudo mkfs.ext4 /dev/mapper/vg_datos-lv_workareas
sudo mount /dev/mapper/vg_datos-lv_docker /var/lib/docker/ 
sudo systemctl restart docker 
sudo mount /dev/mapper/vg_datos-lv_workareas /work/
