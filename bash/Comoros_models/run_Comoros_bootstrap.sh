#!/bin/bash
#SBATCH --time=2-23:00:00
#SBATCH --partition=gelifes
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=Comoros
#SBATCH --output=/data/p287218/relaxedDAISIE/logs/Comoros/Comoros_bootstrap%a.log
#SBATCH --array=1-1000
#SBATCH --mem=1GB

module load R
Rscript /home/p287218/relaxedDAISIE/scripts/Comoros_models/Comoros_bootstrap.R ${SLURM_ARRAY_TASK_ID}
