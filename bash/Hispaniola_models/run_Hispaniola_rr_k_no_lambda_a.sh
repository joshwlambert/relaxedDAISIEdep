#!/bin/bash
#SBATCH --time=9-23:00:00
#SBATCH --partition=gelifes
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=Hispaniola
#SBATCH --output=/home/p287218/relaxedDAISIE/logs/Hispaniola_rr_k_no_lambda_a%a.log
#SBATCH --array=1-10
#SBATCH --mem=5GB

module load R
Rscript /home/p287218/relaxedDAISIE/scripts/Hispaniola_models/Hispaniola_rr_k_no_lambda_a.R ${SLURM_ARRAY_TASK_ID}
