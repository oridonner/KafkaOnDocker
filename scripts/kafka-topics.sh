# kafka topics describe

docker run \
--net=host \
--rm \
confluentinc/cp-kafka:4.1.0 \
kafka-topics --describe --zookeeper localhost:2181

# kafka topics create
docker run \
--net=host \
--rm \
confluentinc/cp-kafka:4.1.0 \
kafka-topics --create --topic twitter-data --zookeeper localhost:2181 --replication-factor 3 --partitions 3 

docker run \
--net=host \
--rm \
confluentinc/cp-kafka:4.1.0 \
kafka-topics --create --topic docker-connect-status --zookeeper localhost:2181 --replication-factor 3 --partitions 3 

docker run \
--net=host \
--rm \
confluentinc/cp-kafka:4.1.0 \
kafka-topics --create --topic docker-connect-configs --zookeeper localhost:2181 --replication-factor 3 --partitions 3 

docker run \
--net=host \
--rm \
confluentinc/cp-kafka:4.1.0 \
kafka-topics --create --topic docker-connect-offsets --zookeeper localhost:2181 --replication-factor 3 --partitions 3 