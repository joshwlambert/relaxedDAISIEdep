#!/bin/bash
#SBATCH --time=9-23:00:00
#SBATCH --partition=gelifes
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=Aldabra_Group
#SBATCH --output=/home/p287218/relaxedDAISIE/logs/Aldabra_Group_rr_k_no_lambda_c%a.log
#SBATCH --array=1-10
#SBATCH --mem=5GB

module load R
Rscript /home/p287218/relaxedDAISIE/scripts/Aldabra_Group_models/Aldabra_Group_rr_k_no_lambda_c.R ${SLURM_ARRAY_TASK_ID}
