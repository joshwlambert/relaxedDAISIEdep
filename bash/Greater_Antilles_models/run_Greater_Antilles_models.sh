#!/bin/bash
#SBATCH --time=2-23:00:00
#SBATCH --partition=gelifes
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=Greater_Antilles
#SBATCH --output=/data/p287218/relaxedDAISIE/logs/Greater_Antilles/Greater_Antilles_models%a.log
#SBATCH --array=0-8
#SBATCH --mem=1GB

mkdir -p inst/results/Comoros
models=(cr_di cr_dd rr_lambda_c_di rr_lambda_c_dd rr_mu_di rr_mu_dd rr_k \
        rr_lambda_a_di rr_lambda_a_dd)

sbatch /data/p287218/relaxedDAISIE/bash/Greater_Antilles_models/run_Greater_Antilles_${models[SLURM_ARRAY_TASK_ID]}.sh
