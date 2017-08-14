packet_size=8
server="10.0.0.11"
clients="10.0.0.12"
time=60000

ssh $server "cd net; killall ./server; ./server $packet_size" &
ssh $clients "killall ./client" &

sleep 5
for test_num in 0 1 2 3 4 5 6 7 8 9
do
    echo "test$test_num starts"

    test_dir=test$test_num
    mkdir $test_dir

for clinet_num in 1 2 4 8 16 32 64 128 256 512
do
    echo "test_num $test_num client_num $clinet_num starts"
    
    mkdir $test_dir/$clinet_num
    
    for((i=0; i<$clinet_num; i++))
    do
        ./client $server $packet_size $time > $test_dir/$clinet_num/$i.txt &
        pids[$i]=$!
    done

    for((i=0; i<$clinet_num; i++))
    do
        wait ${pids[$i]}
    done
    
    echo "client_num $clinet_num ends"
    sleep 5
done

    echo "test$test_num ends"
done
