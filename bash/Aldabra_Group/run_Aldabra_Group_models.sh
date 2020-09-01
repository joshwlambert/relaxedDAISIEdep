#!/bin/bash
#SBATCH --time=9-23:00:00
#SBATCH --partition=gelifes
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=Aldabra_Group
#SBATCH --output=/home/p287218/relaxedDAISIE/logs/Aldabra_Group%a.log
#SBATCH --array=0-4
#SBATCH --mem=5GB

mkdir -p results
mkdir -p results/Aldabra_Group
module load R
models=(cr_di cr_dd cr_di_no_lambda_c cr_dd_no_lambda_c rr_mu_di_no_lambda_c rr_mu_dd_no_lambda_c rr_k_no_lambda_c rr_lambda_a_di_no_lambda_c rr_lambda_a_dd_no_lambda_c)
Rscript /home/p287218/relaxedDAISIE/scripts/Aldabra_Group_models/Aldabra_Group_${models[SLURM_ARRAY_TASK_ID]}.R
