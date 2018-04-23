TOP=`pwd`/..
cd $TOP
NPROC=`grep ^NPROC DATA/Par_file | grep -v -E '^[[:space:]]*#' | cut -d = -f 2 | cut -d \# -f 1`

cmd="mpirun -np $NPROC --allow-run-as-root ./bin/xspecfem3D"
nvprof --csv $cmd
mvprof --query-events
nvprof --query-metrics
nvprof --events inst_executed $cmd
nvprof --metrics all $cmd
nvprof --metrics inst_executed $cmd
nvprof --aggregate-mode-off --source-level-analysis global_access,shared_access,branch,instruction_execution,pc_sampling  $cmd

