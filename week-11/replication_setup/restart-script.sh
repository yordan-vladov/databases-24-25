sudo docker stop mysql-one
sudo docker rm mysql-one
sudo docker compose -f master.yml up -d

sudo docker stop mysql-two
sudo docker rm mysql-two
sudo docker compose -f slave.yml up -d
