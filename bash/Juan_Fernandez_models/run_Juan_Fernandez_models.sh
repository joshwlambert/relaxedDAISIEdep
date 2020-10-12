#!/bin/bash
#SBATCH --time=2-23:00:00
#SBATCH --partition=gelifes
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=Juan_Fernandez
#SBATCH --output=/home/p287218/relaxedDAISIE/logs/Juan_Fernandez_models%a.log
#SBATCH --array=0-8
#SBATCH --mem=5GB

mkdir -p results/Juan_Fernandez
models=(cr_di cr_dd rr_lambda_c_di rr_lambda_c_dd rr_mu_di rr_mu_dd rr_k \
        rr_lambda_a_di rr_lambda_a_dd)

sbatch /home/p287218/relaxedDAISIE/bash/Juan_Fernandez_models/run_Juan_Fernandez_${models[SLURM_ARRAY_TASK_ID]}.sh
