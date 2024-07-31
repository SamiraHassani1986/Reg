#!/bin/bash -e
#SBATCH --time=00:30:00      # Walltime (HH:MM:SS)
#SBATCH --mem=10000MB          # Memory in MB
##SBATCH --qos=debug          # debug QOS for high priority job tests
#SBATCH --ntasks=128
#SBATCH --hint=nomultithread
#SBATCH --mail-user=samira.hassani@pg.canterbury.ac.nz
#SBATCH --mail-type=ALL
#SBATCH --output=ross-%j.out
#SBATCH --error=ross-%j.err
module load GCC/
module load netCDF-C++/
module load netCDF-Fortran/
module load  netCDF/

./bin/terrainCLM45 regcm.in
./bin/mksurfdataCLM45 regcm.in
./bin/sstCLM45 regcm.in
./bin/icbcCLM45 regcm.in

