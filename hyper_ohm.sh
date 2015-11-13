declare -a Dist=("uni-heavy" "uni-medium" "uni-light")
declare -a PDist=("uni-moderate")
#declare -a Util=("1" "2" "3" "4" "5" "6" "7" "8")
declare -a Util=("1")
declare -a Rep=("0")
#declare -a Rep=("0" "1" "2" "3" "4" "5")

for dist in "${Dist[@]}"
do
  for util in "${Util[@]}"
  do
    for rep in "${Rep[@]}"
    do



myapp="myapp"
#sshpass -p 'anch0rs' ssh 192.168.122.129 'screen -d -m cd experiment-scripts/ ;'
sshpass -p 'anch0rs' ssh root@192.168.122.129 'screen -d -m ./run_bench_Array_granular.sh myapp uni-heavy 5 uni-moderate 1 1'
#sshpass -p 'anch0rs' ssh 192.168.122.129 'cd experiment-scripts/ ; ./run_bench_Array_granular.sh myapp '"$dist"' 5 uni-moderate '"$util"' '"$rep"' & exit'





echo "hiii"
sleep 5
infile="hi"
domU=$1
mkdir -p ./run-data 
rawfile="./run-data/xen_raw"
tracefile="./run-data/xen_trace"
xentrace -D -e 0x28000 -S 256 -T 2 ${rawfile}
xenalyze --dump-all ${rawfile} > ${tracefile}
python sched_overhead_mea.py ${tracefile} ${domU} ./run-data/"$dist""_uni-moderate""_""$util""_""$rep"
rm ${rawfile}
rm ${tracefile}

sleep 10
done
done
done



declare -a Dist=("bimo-medium")
declare -a PDist=("uni-moderate")
#declare -a Util=("1" "2" "3" "4" "5" "6" "7" "8")
declare -a Util=("1.0" "2.0")
declare -a Rep=("0" "1")
#declare -a Rep=("0" "1" "2" "3" "4" "5")

for dist in "${Dist[@]}"
do
  for util in "${Util[@]}"
  do
    for rep in "${Rep[@]}"
    do



myapp="myapp"
sshpass -p 'anch0rs' ssh 192.168.122.129 'cd experiment-scripts/ && \
./run_bench_Array_granular_bimo_moderate.sh myapp '"$dist"' 5 uni-moderate '"$util"' '"$rep"''


sleep 5
infile="hi"
domU=$1
mkdir -p ./run-data 
rawfile="./run-data/xen_raw"
tracefile="./run-data/xen_trace"
xentrace -D -e 0x28000 -S 256 -T 2 ${rawfile}
xenalyze --dump-all ${rawfile} > ${tracefile}
python sched_overhead_mea.py ${tracefile} ${domU} ./run-data/"$dist""_uni-moder$
rm ${rawfile}
rm ${tracefile}

sleep 10
done
done
done





