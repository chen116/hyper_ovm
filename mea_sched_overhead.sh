infile=$1
domU=$2
rawfile="xen_raw_""$1"
tracefile="xen_trace_""$1"
xentrace -D -e 0x28000 -S 256 -T 2 ${rawfile}
xenalyze --dump-all ${rawfile} > ${tracefile}
python sched_overhead_mea.py ${tracefile} ${domU}
