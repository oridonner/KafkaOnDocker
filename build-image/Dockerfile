FROM alpine:latest

MAINTAINER Ori Donner <oridonner@gmail.com>

ARG kafka_version
ARG kafka_scala_version
ARG kafka_base_url
ARG SCALA_VERSION=2.11
ARG KAFKA_VERSION=1.1.0


ENV KAFKA_VERSION ${kafka_version:-1.1.0}
ENV KAFKA_SCALA_VERSION ${kafka_scala_version:-2.11}


ENV ADVERTISED_HOSTNAME=127.0.0.1

ENV PATH $PATH:/kafka/bin

ENV TAR="kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz"

ENV KAFKA_BASE_URL ${kafka_base_url:-http://apache.uib.no}
ENV KAFKA_URL "$KAFKA_BASE_URL/kafka/$KAFKA_VERSION/kafka_$KAFKA_SCALA_VERSION-$KAFKA_VERSION.tgz"
ENV KAFKA_HOME /opt/kafka

WORKDIR /opt

RUN wget -O - $KAFKA_URL | tar zxf - && \
    mv /opt/kafka_$KAFKA_SCALA_VERSION-$KAFKA_VERSION $KAFKA_HOME


----------------------------------------
MAINTAINER Hari Sekhon (https://www.linkedin.com/in/harisekhon)


# 0.10 fails to come up
#ARG KAFKA_VERSION=0.10.0.0




# bash => entrypoint.sh
# perl => entrypoint.sh kafka configs in place edit for advertised hostname
# java => kafka
RUN set -euxo pipefail && \
    apk add --no-cache bash perl openjdk8-jre-base

RUN set -euxo pipefail && \
    apk add --no-cache tar wget && \
    wget -t 10 --retry-connrefused -O "$TAR" "https://www.apache.org/dyn/closer.cgi?filename=/kafka/${KAFKA_VERSION}/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz&action=download" || \
    wget -t 10 --retry-connrefused -O "$TAR" "http://archive.apache.org/dist/kafka/${KAFKA_VERSION}/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz" && \
    tar zxf "kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz" && \
    rm -fv "kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz" && \
    ln -sv "kafka_${SCALA_VERSION}-${KAFKA_VERSION}" kafka && \
    apk del tar wget

COPY entrypoint.sh /

EXPOSE 2181 9092

CMD /entrypoint.sh