sudo docker network rm mysql-replication-network
sudo docker network create mysql-replication-network
sudo docker network connect mysql-replication-network mysql-one
sudo docker network connect mysql-replication-network mysql-two
