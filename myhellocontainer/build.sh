#!/bin/bash

docker build -t localhost:5000/myhelloapp:latest .
docker push localhost:5000/myhelloapp:latest
