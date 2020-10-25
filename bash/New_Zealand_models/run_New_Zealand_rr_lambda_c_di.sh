#!/bin/bash
#SBATCH --time=2-23:00:00
#SBATCH --partition=gelifes
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=New_Zealand
#SBATCH --output=/data/p287218/relaxedDAISIE/logs/New_Zealand/New_Zealand_rr_lambda_c_di%a.log
#SBATCH --array=1-10
#SBATCH --mem=1GB

module load R
Rscript /data/p287218/relaxedDAISIE/scripts/New_Zealand_models/New_Zealand_rr_lambda_c_di.R ${SLURM_ARRAY_TASK_ID}
