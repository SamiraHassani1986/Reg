#!/bin/bash -e
#SBATCH --job-name=RegCM # job name (shows up in the queue)
#SBATCH --time=00:20:00      # Walltime (HH:MM:SS)
#SBATCH --mem=512MB          # Memory in MB
#SBATCH --qos=debug          # debug QOS for high priority job tests
#SBATCH --ntasks=100
#SBATCH --hint=nomulthread
#SBATCH --mail-user=samira.hassani@pg.canterbury.ac.nz
#SBATCH --mail-type=ALL
#SBATCH --output=ross-%j.out
#SBATCH --error=ross-%j.err
load module GCC
load module netCDF-C++/
load module netCDF-Fortran/
load module netCDF/

srun --output=regcm.out ./bin/regcmMPICLM45 first_test.in 
