#!/bin/bash -x

exec /opt/spark/bin/spark-class org.apache.spark.deploy.worker.Worker -m $SLAVE_MEMORY -c $SLAVE_CORES -p $SPARK_WORKER_PORT -d "$SLAVE_WORKDIR"  "$SPARK_MASTER"
