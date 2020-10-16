#!/bin/bash
#SBATCH --time=2-23:00:00
#SBATCH --partition=gelifes
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=Ogasawara
#SBATCH --output=/home/p287218/relaxedDAISIE/logs/Ogasawara/Ogasawara_bootstrap%a.log
#SBATCH --array=1-1000
#SBATCH --mem=1GB

module load R
Rscript /home/p287218/relaxedDAISIE/scripts/Ogasawara_models/Ogasawara_bootstrap.R ${SLURM_ARRAY_TASK_ID}