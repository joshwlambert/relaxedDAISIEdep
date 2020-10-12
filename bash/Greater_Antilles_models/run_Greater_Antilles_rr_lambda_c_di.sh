#!/bin/bash
#SBATCH --time=2-23:00:00
#SBATCH --partition=gelifes
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=Greater_Antilles
#SBATCH --output=/home/p287218/relaxedDAISIE/logs/Greater_Antilles_rr_lambda_c_di%a.log
#SBATCH --array=1-10
#SBATCH --mem=5GB

module load R
Rscript /home/p287218/relaxedDAISIE/scripts/Greater_Antilles_models/Greater_Antilles_rr_lambda_c_di.R ${SLURM_ARRAY_TASK_ID}
