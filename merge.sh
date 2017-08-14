#!/bin/bash

file_num=$#
echo "going to merge $file_num files:"

for((i=1; i<=$file_num; i++))
do
        files[$i]=$1
        echo ${files[$i]}
        shift
done

tmp_dir=merged_tmp
mkdir $tmp_dir

for i in 1 2 4 8 16 32 64 128 256 512
do
    mkdir $tmp_dir/$i
    for((j=1; j<=$file_num; j++))
    do
        cat ${files[$j]}/$i/* >> $tmp_dir/$i/sum.txt
    done
done
