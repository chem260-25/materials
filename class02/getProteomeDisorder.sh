#! /bin/bash
curl -o $1.dat "https://mobidb.org/api/download?proteome=$1&projection=acc,prediction-disorder-th_50,name,organism,length&format=csv"
sed -i '/name.*prediction-disorder-th_50/!d' $1.dat
grep -oE '"acc":"([^"]*)"' $1.dat | cut -d : -f 2 > acc.tmp
grep -oE '"length":([^,]*)' $1.dat | cut -d : -f 2 > len.tmp
grep -oE '"content_fraction":([^,}]*)' $1.dat | cut -d : -f 2 > f_dis.tmp
grep -oE '"name":([^,]*)' $1.dat | cut -d : -f 2 > name.tmp
echo "acc,name,len,disorder_prediction" > $1.dc
paste -d "," acc.tmp name.tmp len.tmp f_dis.tmp >> $1.dc
rm -rf *tmp

