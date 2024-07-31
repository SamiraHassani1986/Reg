#!/bin/bash -e
#SBATCH --job-name=RegCM # job name (shows up in the queue)
#SBATCH --time=00:60:00      # Walltime (HH:MM:SS)
#SBATCH --mem=100000MB          # Memory in MB
##SBATCH --qos=debug          # debug QOS for high priority job tests
#SBATCH --ntasks=128
#SBATCH --hint=nomultithread
#SBATCH --mail-user=samira.hassani@pg.canterbury.ac.nz
#SBATCH --mail-type=ALL
#SBATCH --output=ross-%j.out
#SBATCH --error=ross-%j.err
module load GCC/
module load netCDF-C++/
module load  netCDF-Fortran/
module load  netCDF/

srun --output=regcm.out ./bin/regcmMPICLM45 regcm.in 
