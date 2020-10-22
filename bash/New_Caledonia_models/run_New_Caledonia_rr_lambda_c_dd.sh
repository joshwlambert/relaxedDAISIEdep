#!/bin/bash
#SBATCH --time=2-23:00:00
#SBATCH --partition=gelifes
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=New_Caledonia
#SBATCH --output=/home/p287218/relaxedDAISIE/logs/New_Caledonia/New_Caledonia_rr_lambda_c_dd%a.log
#SBATCH --array=1-10
#SBATCH --mem=1GB

module load R
Rscript /home/p287218/relaxedDAISIE/scripts/New_Caledonia_models/New_Caledonia_rr_lambda_c_dd.R ${SLURM_ARRAY_TASK_ID}
