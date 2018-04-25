docker-compose exec broker-1  \
kafka-console-consumer --bootstrap-server localhost:9092 --topic twitter-data --from-beginning