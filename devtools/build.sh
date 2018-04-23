TOP=`pwd`/..

cd $TOP
apt upate && apt install zlib1g-dev
./configure FC=gfortran CC=gcc MPIFC=mpif90 --with-mpi
make  -j 
