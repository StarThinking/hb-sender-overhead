for i in 2 4 8 16 32 64 128 256 512; do echo $i;cat $i/* | awk '{s+=$1} END {print s}'; done
