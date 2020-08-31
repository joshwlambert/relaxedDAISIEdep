#!/bin/bash
#SBATCH --time=9-23:00:00
#SBATCH --partition=gelifes
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=Aldabra_Group_cr
#SBATCH --output=/home/p287218/relaxedDAISIE/logs/Aldabra_Group_cr.log
#SBATCH --array=(cr_di, cr_dd, cr_di_no_lambda_c, cr_dd_no_lambda_c)
#SBATCH --mem=5GB

module load R
#for i in "${array[@]}"; do echo "$i"; done
Rscript /home/p287218/relaxedDAISIE/scripts/Aldabra_Group_models${SLURM_ARRAY_TASK_ID}.R
