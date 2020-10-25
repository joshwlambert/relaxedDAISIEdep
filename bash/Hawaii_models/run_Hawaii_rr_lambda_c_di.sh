#!/bin/bash
#SBATCH --time=2-23:00:00
#SBATCH --partition=gelifes
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=Hawaii
#SBATCH --output=/data/p287218/relaxedDAISIE/logs/Hawaii/Hawaii_rr_lambda_c_di%a.log
#SBATCH --array=1-10
#SBATCH --mem=1GB

module load R
Rscript /data/p287218/relaxedDAISIE/scripts/Hawaii_models/Hawaii_rr_lambda_c_di.R ${SLURM_ARRAY_TASK_ID}
