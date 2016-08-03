#!/bin/bash

/opt/spark/bin/spark-submit --class org.apache.spark.examples.SparkPi --master spark://spark:7077 --executor-memory 500M /opt/spark/examples/jars/spark-examples_2.11-2.0.0.jar
