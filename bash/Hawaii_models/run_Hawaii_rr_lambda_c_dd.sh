#!/bin/bash
#SBATCH --time=9-23:00:00
#SBATCH --partition=gelifes
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=Hawaii
#SBATCH --output=/home/p287218/relaxedDAISIE/logs/Hawaii_rr_lambda_c_dd%a.log
#SBATCH --array=1-10
#SBATCH --mem=5GB

module load R
Rscript /home/p287218/relaxedDAISIE/scripts/Hawaii_models/Hawaii_rr_lambda_c_dd.R ${SLURM_ARRAY_TASK_ID}