#!/bin/bash
echo "minimum temperature: $1"
echo "maximum temperature: $2"
echo "minimum density:     $3"
echo "maximum density:     $4"
orig_dir=`pwd`
for i in `seq $1 0.2 $2`; do
	for j in `seq $3 0.2 $4`; do
        echo "RUN MDSS with parameters $i $j"
        direct="mdss_output/${i}_${j}"
		mkdir -p $direct
        cd $direct
		$orig_dir/MDSS.py $i $j &> output.dat
        cd $orig_dir
	done
done
