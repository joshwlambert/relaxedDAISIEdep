#!/bin/bash
#SBATCH --time=2-23:00:00
#SBATCH --partition=gelifes
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=Hispaniola
#SBATCH --output=/data/p287218/relaxedDAISIE/logs/Hispaniola/Hispaniola_cr_dd_no_lambda_a%a.log
#SBATCH --array=1-10
#SBATCH --mem=1GB

module load R
Rscript /data/p287218/relaxedDAISIE/scripts/Hispaniola_models/Hispaniola_cr_dd_no_lambda_a.R ${SLURM_ARRAY_TASK_ID}
