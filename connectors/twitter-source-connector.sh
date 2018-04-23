# Source connector
echo '{"name": "source-twitter-distributed", "config":{"connector.class":"com.eneco.trading.kafka.connect.twitter.TwitterSourceConnector","tasks.max":"1","topic":"twitter-data","key.converter":"org.apache.kafka.connect.json.JsonConverter","key.converter.schemas.enable":"true","value.converter":"org.apache.kafka.connect.json.JsonConverter","value.converter.schemas.enable":"true","twitter.consumerkey":"9jT7rYU09ELMSibxgVK7tRpRs","twitter.consumersecret":"ggQg21pZLFcexZ0PjTX1zRtG0bHHuWFhMx4DxGfRAVD2xwrHR4","twitter.token":"2932095118-245Itf5j2H01MDrRq0MMPNtPHTIxER4e3Cj2hoD","twitter.secret":"7kAn2qXA7wJJ8k46ySj1lri9Reey9h2NLAxLPtFUkjVgb","track.terms":"programming,java,kafka,scala","language":"en"}}' | \
curl -X POST -d @- http://localhost:8083/connectors \
--header "Content-Type:application/json"

# Sink connector
echo '{"name": "sink-twitter-distributed", "config":{"connector.class":"com.eneco.trading.kafka.connect.twitter.TwitterSinkConnector","tasks.max":"1","topics":"text-to-tweet","key.converter":"org.apache.kafka.connect.json.JsonConverter","key.converter.schemas.enable":"true","value.converter":"org.apache.kafka.connect.json.JsonConverter","value.converter.schemas.enable":"true","twitter.consumerkey":"9jT7rYU09ELMSibxgVK7tRpRs","twitter.consumersecret":"ggQg21pZLFcexZ0PjTX1zRtG0bHHuWFhMx4DxGfRAVD2xwrHR4","twitter.token":"2932095118-245Itf5j2H01MDrRq0MMPNtPHTIxER4e3Cj2hoD","twitter.secret":"7kAn2qXA7wJJ8k46ySj1lri9Reey9h2NLAxLPtFUkjVgb","track.terms":"programming,java,kafka,scala","language":"en"}}' | \
curl -X POST -d @- http://localhost:8083/connectors \
--header "Content-Type:application/json"