#!/bin/bash

MPI=mpich
VERSION=3.2
USER=mpiuser

rm -rf /home/$USER/build-tool-$MPI
cd /home/$USER/$MPI-$VERSION
make clean
./configure --prefix=/home/$USER/build-tool-$MPI/
make
make install 
