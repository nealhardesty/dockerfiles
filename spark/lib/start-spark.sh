#!/bin/bash

(sleep 1 && /start-spark-slave.sh) &
exec /start-spark-master.sh
