
declare -a Dist=("bimo-medium")
#"uni-medium" "uni-light")
declare -a PDist=("uni-moderate" "uni-longRTXen")
declare -a Util=("1" "2" "3" "4" "5" "6" "7" "8")
#declare -a Util=("1")
declare -a Rep=("0")
#declare -a Rep=("0" "1" "2" "3" "4" "5")

for dist in "${Dist[@]}"
do
  for util in "${Util[@]}"
  do
    for rep in "${Rep[@]}"
    do



#myapp="myapp"
#sshpass -p 'anch0rs' ssh 192.168.122.170 'screen -d -m mkdir test ;'
#sshpass -p 'anch0rs' ssh root@192.168.122.170 'screen -d -m ~/hyper_ovm/run_bench_Array_granular.sh myapp uni-heavy 5 uni-moderate 1 1'
#sshpass -p 'anch0rs' ssh 192.168.122.151 '~/hyper_ovm/run_bench_Array_granular.sh myapp '"$dist"' 5 uni-moderate '"$util"' '"$rep"' & exit'
#sshpass -p 'anch0rs' ssh root@192.168.122.174 'screen -S 3298 -X stuff '"'"'~/hyper_ovm/run_bench_Array_granular.sh myapp uni-heavy 5 uni-moderate 1 1'"'"'`echo -ne '"'"'\015'"'"'` && exit'

ssh root@192.168.122.151 '/usr/bin/screen -S test -p 0 -X stuff "~/hyper_ovm/run_bench_Array_granular.sh myapp '"$dist"' 5 uni-moderate '"$util"' '"$rep"' $(printf \\r)"'
#ssh root@192.168.122.151 'screen -S 3298 -X stuff '"'"'~/hyper_ovm/run_bench_Array_granular.sh myapp '"$dist"' 5 uni-moderate '"$util"' '"$rep"' '"'"'`echo -ne '"'"'\015'"'"'` && exit'
#sshpass -p 'anch0rs' ssh root@192.168.122.151 'screen -S 3298 -X stuff '"'"'~/hyper_ovm/run_bench_Array_granular.sh myapp '"$dist"' 5 uni-moderate '"$util"' '"$rep"' '"'"'`echo -ne '"'"'\015'"'"'` && exit'

sleep 5
infile="hi"
domU=$1
mkdir -p ./run-data 
rawfile="./run-data/xen_raw"
tracefile="./run-data/""$dist""_uni-moderate""_""$util""_""$rep"
rm ${rawfile}
rm ${tracefile}

echo "start recording....."
xentrace -D -e 0x28000 -S 256 -T 2 ${rawfile}
xenalyze --dump-all ${rawfile} > ${tracefile}
echo run-data/"$dist""_uni-moderate""_""$util""_""$rep"
fileee="run-data/""$dist""_uni-moderate""_""$util""_""$rep"
echo ${fileee}
python sched_overhead_mea.py ${tracefile} ${fileee}
rm ${rawfile}


sleep 25
done
done
done

: <<'END'
declare -a Dist=("bimo-medium")
declare -a PDist=("uni-moderate")
declare -a Util=("1.0" "2.0" "3.0" "4.0" "5.0" "6.0" "7.0" "8.0")
#declare -a Util=("1")
declare -a Rep=("0")
#declare -a Rep=("0" "1" "2" "3" "4" "5")

for dist in "${Dist[@]}"
do
  for util in "${Util[@]}"
  do
    for rep in "${Rep[@]}"
    do



myapp="myapp"
#sshpass -p 'anch0rs' ssh 192.168.122.170 'screen -d -m mkdir test ;'
#sshpass -p 'anch0rs' ssh root@192.168.122.170 'screen -d -m ~/hyper_ovm/run_bench_Array_granular.sh myapp uni-heavy 5 uni-moderate 1 1'
#sshpass -p 'anch0rs' ssh 192.168.122.129 'cd experiment-scripts/ ; ./run_bench_Array_granular.sh myapp '"$dist"' 5 uni-moderate '"$util"' '"$rep"' & exit'
sshpass -p 'anch0rs' ssh root@192.168.122.174 'screen -S 3298 -X stuff '"'"'~/hyper_ovm/run_bench_Array_granular_bimo_moderate.sh myapp '"$dist"' 5 uni-moderate '"$util"' '"$rep"' '"'"'`echo -ne$
#sshpass -p 'anch0rs' ssh root@192.168.122.174 'screen -S 3298 -X stuff '"'"'~/hyper_ovm/run_bench_Array_granular.sh myapp uni-heavy 5 uni-moderate 1 1'"'"'`echo -ne '"'"'\015'"'"'$

sleep 5
infile="hi"
domU=$1
mkdir -p ./run-data 
rawfile="./run-data/xen_raw"
tracefile="./run-data/xen_trace"
echo "start recording.....""$dist""_uni-moderate""_""$util""_""$rep"
xentrace -D -e 0x28000 -S 256 -T 2 ${rawfile}
xenalyze --dump-all ${rawfile} > ${tracefile}
python sched_overhead_mea.py ${tracefile} ${domU} ./run-data/"$dist""_uni-moderate""_""$util""_""$rep"
rm ${rawfile}
rm ${tracefile}

sleep 25
done
done
done


declare -a Dist=("bimo-medium")
declare -a PDist=("uni-longRTXen")
declare -a Util=("1" "2" "3" "4" "5" "6" "7" "8")
#declare -a Util=("1")
declare -a Rep=("0")
#declare -a Rep=("0" "1" "2" "3" "4" "5")

for dist in "${Dist[@]}"
do
  for util in "${Util[@]}"
  do
    for rep in "${Rep[@]}"
    do



myapp="myapp"
#sshpass -p 'anch0rs' ssh 192.168.122.170 'screen -d -m mkdir test ;'
#sshpass -p 'anch0rs' ssh root@192.168.122.170 'screen -d -m ~/hyper_ovm/run_bench_Array_granular.sh myapp uni-heavy 5 uni-moderate 1 1'
#sshpass -p 'anch0rs' ssh 192.168.122.129 'cd experiment-scripts/ ; ./run_bench_Array_granular.sh myapp '"$dist"' 5 uni-moderate '"$util"' '"$rep"' & exit'
sshpass -p 'anch0rs' ssh root@192.168.122.174 'screen -S 3298 -X stuff '"'"'~/hyper_ovm/run_bench_Array_granular.sh myapp '"$dist"' 5 uni-longRTXen '"$util"' '"$rep"' '"'"'`echo -ne$
#sshpass -p 'anch0rs' ssh root@192.168.122.174 'screen -S 3298 -X stuff '"'"'~/hyper_ovm/run_bench_Array_granular.sh myapp uni-heavy 5 uni-moderate 1 1'"'"'`echo -ne '"'"'\015'"'"'$

sleep 5
infile="hi"
domU=$1
mkdir -p ./run-data 
rawfile="./run-data/xen_raw"
tracefile="./run-data/xen_trace"
echo "start recording.....""$dist""_uni-longRTXen""_""$util""_""$rep"
xentrace -D -e 0x28000 -S 256 -T 2 ${rawfile}
xenalyze --dump-all ${rawfile} > ${tracefile}
python sched_overhead_mea.py ${tracefile} ${domU} ./run-data/"$dist""_uni-longRTXen""_""$util""_""$rep"
rm ${rawfile}
rm ${tracefile}

sleep 25
done
done
done
END

