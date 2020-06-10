#!/bin/sh

mkdir -p /usr/local/etc/redis;

echo "$REDIS_CONFIG" > /usr/local/etc/redis/redis.conf;

redis-server /usr/local/etc/redis/redis.conf