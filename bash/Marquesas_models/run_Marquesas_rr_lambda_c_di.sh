#!/bin/bash
#SBATCH --time=2-23:00:00
#SBATCH --partition=gelifes
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=Marquesas
#SBATCH --output=/home/p287218/relaxedDAISIE/logs/Marquesas/Marquesas_rr_lambda_c_di%a.log
#SBATCH --array=1-10
#SBATCH --mem=1GB

module load R
Rscript /home/p287218/relaxedDAISIE/scripts/Marquesas_models/Marquesas_rr_lambda_c_di.R ${SLURM_ARRAY_TASK_ID}
