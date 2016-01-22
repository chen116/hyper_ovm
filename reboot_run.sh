
declare -a Util=("1.2" "3.4")
#myapps="myapp"
date
iter=2
i=0
while [ $i -lt $iter ]; 
do
  for util in $Util
  do
    myapp="myapp""$i"
    echo $myapp
    xl reboot ubuntu_litmus_bench  
    sleep 35
    xl sched-rtds -d ubuntu_litmus_bench -b 2000 -p 4000
    sleep 1
    #ssh 192.168.122.197 'screen -d -m mkdir '"$myapp"''
    #ssh 192.168.122.197 '~/experiment-scripts/reboot_run_bench_Array_granular.sh '"$myapp"' uni-medium 10 uni-moderate '"$util"' '
    #ssh 192.168.122.197 'screen -d -m  /root/experiment-scripts/reboot_rerun.sh '"$myapp"' '"$util"''
   
    #ssh 192.168.122.197 'screen -d -m `echo -ne /root/experiment-scripts/reboot_rerun.sh '"$myapp"' '"$util"'`' 
  

    ssh 192.168.122.197 '/root/experiment-scripts/reboot_rerun.sh '"$myapp"' '"$util"''
    #ssh 192.168.122.197 'screen -S test -m ~/experiment-scripts/reboot_rerun.sh '"$myapp"' '"$util"''
    #ssh 192.168.122.197 'screen -S 3298 -X stuff '"'"'~/experiment-scripts/reboot_rerun.sh '"$myapp"' '"$util"' '"'"'`echo -ne '"'"'\015'"'"'` && exit'
    #sshpass -p 'anch0rs' ssh root@192.168.122.197 'mkdir "myapp"'"$i"''
    # sshpass -p 'anch0rs' ssh root@192.168.122.174 'screen -S 3298 -X stuff '"'"'~/hyper_ovm/run_bench_Array_granular.sh myapp '"$dist"' 5 uni-moderate '"$util"' '"$rep"' '"'"'`echo -ne '"'"'\015'"'"'` && exit'
    sleep 600
    #ssh 192.168.122.197 'ls ~/experiment-scripts/run-data-fig2'
  done 
echo "==="
i=$((i+1))

done
#ssh 192.168.122.197 'ls'
date
