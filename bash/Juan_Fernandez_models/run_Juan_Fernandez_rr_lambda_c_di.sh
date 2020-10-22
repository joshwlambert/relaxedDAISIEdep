#!/bin/bash
#SBATCH --time=2-23:00:00
#SBATCH --partition=gelifes
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=Juan_Fernandez
#SBATCH --output=/data/p287218/relaxedDAISIE/logs/Juan_Fernandez/Juan_Fernandez_rr_lambda_c_di%a.log
#SBATCH --array=1-10
#SBATCH --mem=1GB

module load R
Rscript /home/p287218/relaxedDAISIE/scripts/Juan_Fernandez_models/Juan_Fernandez_rr_lambda_c_di.R ${SLURM_ARRAY_TASK_ID}
