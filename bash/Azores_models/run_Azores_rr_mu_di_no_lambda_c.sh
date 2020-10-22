#!/bin/bash
#SBATCH --time=2-23:00:00
#SBATCH --partition=gelifes
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=Azores
#SBATCH --output=/data/p287218/relaxedDAISIE/logs/Azores/Azores_rr_mu_di_no_lambda_c%a.log
#SBATCH --array=1-10
#SBATCH --mem=1GB

module load R
Rscript /home/p287218/relaxedDAISIE/scripts/Azores_models/Azores_rr_mu_di_no_lambda_c.R ${SLURM_ARRAY_TASK_ID}
