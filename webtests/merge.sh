#!/bin/bash

for i in {1..200}
do
	cat $i.tsv |grep Wed >> merged.tsv
	rm $i.tsv
done
