TOP=`pwd`/..
cd $TOP
NPROC=`grep ^NPROC DATA/Par_file | grep -v -E '^[[:space:]]*#' | cut -d = -f 2 | cut -d \# -f 1`

cmd="mpirun -np $NPROC --allow-run-as-root ./bin/xspecfem3D"
cuda-gdb  --args $cmd
