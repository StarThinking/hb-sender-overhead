dir=$1
count=10

cd $dir 

for i in 1 2 4 8 16 32 64 128 256 512; 
do 
    echo $i
    total=`cat $i/* | awk '{s+=$1} END {print s}'`
    echo "scale=2; $total / $count" | bc
done
