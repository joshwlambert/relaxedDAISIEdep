#!/bin/bash
#SBATCH --time=2-23:00:00
#SBATCH --partition=gelifes
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=Greater_Antilles
#SBATCH --output=/data/p287218/relaxedDAISIE/logs/Greater_Antilles/Greater_Antilles_bootstrap%a.log
#SBATCH --array=1-1000
#SBATCH --mem=1GB

module load R
Rscript /data/p287218/relaxedDAISIE/scripts/Greate_Antilles_models/Greater_Antilles_bootstrap.R ${SLURM_ARRAY_TASK_ID}
