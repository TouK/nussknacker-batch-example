FROM flink:1.18.1-scala_2.12-java11

ENV FLINK_VERSION_SHORT=1.18
ENV HADOOP_VERSION=2.8.3
ENV FLINK_HADOOP_VERSION="${HADOOP_VERSION}-10.0"
ENV AWS_SDK_VERSION=2.26.10
ENV ICEBERG_VERSION=1.5.2
ENV FAKER_VERSION=0.5.3

RUN curl -L https://github.com/knaufk/flink-faker/releases/download/v${FAKER_VERSION}/flink-faker-${FAKER_VERSION}.jar -o ${FLINK_HOME}/lib/flink-faker-${FAKER_VERSION}.jar

RUN curl -L https://repo1.maven.org/maven2/org/apache/iceberg/iceberg-flink-runtime-${FLINK_VERSION_SHORT}/${ICEBERG_VERSION}/iceberg-flink-runtime-${FLINK_VERSION_SHORT}-${ICEBERG_VERSION}.jar \
    -o ${FLINK_HOME}/lib/iceberg-flink-runtime-${FLINK_VERSION_SHORT}-${ICEBERG_VERSION}.jar

RUN curl -L "https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-common/${HADOOP_VERSION}/hadoop-common-${HADOOP_VERSION}.jar" \
    -o ${FLINK_HOME}/lib/hadoop-common-${HADOOP_VERSION}.jar

RUN curl -L "https://repo.maven.apache.org/maven2/org/apache/flink/flink-shaded-hadoop-2-uber/${FLINK_HADOOP_VERSION}/flink-shaded-hadoop-2-uber-${FLINK_HADOOP_VERSION}.jar" \
    -o ${FLINK_HOME}/lib/flink-shaded-hadoop-2-uber-${FLINK_HADOOP_VERSION}.jar

RUN curl -L "https://repo1.maven.org/maven2/software/amazon/awssdk/bundle/${AWS_SDK_VERSION}/bundle-${AWS_SDK_VERSION}.jar" \
    -o ${FLINK_HOME}/lib/bundle-${AWS_SDK_VERSION}.jar