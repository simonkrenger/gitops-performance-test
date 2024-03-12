#!/bin/bash

wd=$(dirname $(readlink -f $0))

rm -rf ${wd}/instances/*

for i in $(seq 1 120); do
    id=$(echo $RANDOM | md5sum | head -c 10; echo)
    mkdir -p ${wd}/instances/$id
    echo "{ 'id': '${id}' }" > ${wd}/instances/$id/config.json
done

echo "Created instances in ${wd}/instances"