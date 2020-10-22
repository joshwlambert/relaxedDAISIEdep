#!/bin/bash
#SBATCH --time=2-23:00:00
#SBATCH --partition=gelifes
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=Canaries
#SBATCH --output=/data/p287218/relaxedDAISIE/logs/Canaries/Canaries_bootstrap%a.log
#SBATCH --array=1-1000
#SBATCH --mem=1GB

module load R
Rscript /data/p287218/relaxedDAISIE/scripts/Canaries_models/Canaries_bootstrap.R ${SLURM_ARRAY_TASK_ID}
