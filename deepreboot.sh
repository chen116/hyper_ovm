
declare -a Util=("3.4" "3.6" "4.2" "4.4")
#myapps="myapp"
date
iter=10
i=99
util=0.2
while [ $i -lt $iter ]; do
  for util in "${Util[@]}"
  do
    myapp="myapp""$i"
    echo $myapp
    echo $util
    ssh 192.168.122.67 '/usr/bin/screen -d -m -S test'
    ssh 192.168.122.67 '/usr/bin/screen -S test -p 0 -X stuff "~/experiment-scripts/rerun.sh $(printf \\r)"'
    ssh 192.168.122.80 '/usr/bin/screen -d -m -S test'
    ssh 192.168.122.80 '/usr/bin/screen -S test -p 0 -X stuff "~/experiment-scripts/reboot_rerun.sh '"$myapp"' '"$util"' $(printf \\r)"'
    sleep 600


  done 
echo "==="
i=$((i+1))
done
#ssh 192.168.122.197 'ls'
date
