#!/bin/bash
#SBATCH --time=2-23:00:00
#SBATCH --partition=gelifes
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=Palau
#SBATCH --output=/home/p287218/relaxedDAISIE/logs/Palau/Palau_rr_lambda_a_dd_no_lambda_c%a.log
#SBATCH --array=1-10
#SBATCH --mem=5GB

module load R
Rscript /home/p287218/relaxedDAISIE/scripts/Palau_models/Palau_rr_lambda_a_dd_no_lambda_c.R ${SLURM_ARRAY_TASK_ID}
