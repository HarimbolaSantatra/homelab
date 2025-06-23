#!/bin/bash
data="/var/opt/data.csv"
echo "$(date +%D-%X),sentinel,TPS,$(shuf -i 1-100 -n 1)" >> $data
echo "$(date +%D-%X),adaptit,TPS,$(shuf -i 1-100 -n 1)" >> $data
echo "$(date +%D-%X),s3,TPS,$(shuf -i 1-100 -n 1)" >> $data
