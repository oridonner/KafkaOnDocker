# kafka topics describe

sudo docker run \
--net=host \
--rm \
confluentinc/cp-kafka:4.1.0 \
kafka-topics --describe --zookeeper localhost:2181

# kafka topics create
sudo docker run \
--net=host \
--rm \
confluentinc/cp-kafka:4.1.0 \
kafka-topics --create --topic test --zookeeper localhost:2181 --replication-factor 3 --partitions 3 