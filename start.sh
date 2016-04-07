#! /bin/bash

# default mongo ip
MONGO_IP=localhost
MONGO_PORT=27017

# mongo ip from linked container
if [ ! -z ${MONGODB_PORT_27017_TCP_ADDR} ] ; then
  MONGO_IP=${MONGODB_PORT_27017_TCP_ADDR}
fi

# mongo ip from env
if [ ! -z ${MONGO_HOST} ] ; then
  MONGO_IP=${MONGO_HOST}
fi

# mongo port from linked container
if [ ! -z ${MONGODB_PORT_27017_TCP_PORT} ] ; then
  MONGO_PORT=${MONGODB_PORT_27017_TCP_PORT}
fi

# mongo port from env
if [ ! -z ${MONGO_PORT} ] ; then
  MONGO_PORT=${MONGO_PORT}
fi

init_mongo () {
mongo --host ${MONGO_IP} --port ${MONGO_PORT} <<EOF
rs.initiate()
rs.config()
EOF
}

echo "mongo --host ${MONGO_IP} --port ${MONGO_PORT}"
init_mongo
