#infile=$1
#domU=$2
#mkdir -p ./run-data 
#rawfile="xen_raw_""$1"
#tracefile="xen_trace_""$1"
#xentrace -D -e 0x28000 -S 256 -T 2 ${rawfile}
#xenalyze --dump-all ${rawfile} > ${tracefile}
#python sched_overhead_mea.py ${tracefile} ${domU}


dist=$1


domU="4"
mkdir -p ./run-data 
rawfile="./run-data/xen_raw"
tracefile="./run-data/xen_trace"
xentrace -D -e 0x28000 -S 256 -T 2 ${rawfile}
xenalyze --dump-all ${rawfile} > ${tracefile}
python sched_overhead_mea.py ${tracefile} ${domU} ./run-data/"$dist"
rm ${rawfile}
rm ${tracefile}
