#!/bin/bash

kubectl exec --tty be1 -- /interfacesetup.sh 10.201.0.1 10.200.0.253 24
kubectl exec --tty be2 -- /interfacesetup.sh 10.201.0.1 10.200.0.252 24
kubectl exec --tty be3 -- /interfacesetup.sh 10.201.0.1 10.200.0.251 24
kubectl exec --tty be4 -- /interfacesetup.sh 10.201.0.1 10.200.0.250 24
kubectl exec --tty be5 -- /interfacesetup.sh 10.201.0.1 10.200.0.249 24
kubectl exec --tty be6 -- /interfacesetup.sh 10.201.0.1 10.200.0.248 24
