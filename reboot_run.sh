
declare -a Util=("3.4" "3.6" "4.2" "4.4")
#myapps="myapp"
date
iter=10
i=0
while [ $i -lt $iter ]; do
  for util in "${Util[@]}"
  do
    myapp="myapp""$i"
    echo $myapp
    echo $util
    xl reboot ubuntu_litmus_bench  
    sleep 35
    xl sched-rtds -d ubuntu_litmus_bench -b 2000 -p 4000
    sleep 1
    ssh 192.168.122.80 '/root/experiment-scripts/reboot_rerun.sh '"$myapp"' '"$util"''
    echo "starting sleeping for 600 sec"
     sleep 600
    echo "done sleeping for 600sec"
  done 
echo "==="
i=$((i+1))
done
#ssh 192.168.122.197 'ls'
date
