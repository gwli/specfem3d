TOP=`pwd`/..
cd $TOP
NPROC=`grep ^NPROC DATA/Par_file | grep -v -E '^[[:space:]]*#' | cut -d = -f 2 | cut -d \# -f 1`

cmd="mpirun -np $NPROC --allow-run-as-root ./bin/xspecfem3D"
sp="/raid/tools/SP/NsightSystems-linux-public-2018.0.0.170-5fe72bc/Target-x86_64/x86_64/sp"

rm -fr ./*.qdstrm
$sp profile --duration=10 -o lmmps.qdstrm -t cuda,cublas,curand,cudnn,osrt $cmd
