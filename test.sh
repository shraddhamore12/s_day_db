#!/bin/bash

# remove the container if exists or running 
if [ $( sudo docker container ls -q --filter name=mydb_c) != '' ]; then
    sudo docker container stop mydb_c
    sudo docker container rm mydb_c
fi

# remove the image if exists
if [ $( sudo docker image ls -q --filter reference=mydb) != '' ]; then
    sudo docker image rm mydb
fi

# build the image
sudo docker build -t mydb .

# start the container
sudo docker run -itd -p 9099:3306 --name mydb_c mydb
