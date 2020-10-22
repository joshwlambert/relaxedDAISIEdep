#!/bin/bash
#SBATCH --time=2-23:00:00
#SBATCH --partition=gelifes
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=Hawaii
#SBATCH --output=/data/p287218/relaxedDAISIE/logs/Hawaii/Hawaii_models%a.log
#SBATCH --array=0-8
#SBATCH --mem=1GB

mkdir -p inst/results/Hawaii
models=(cr_di cr_dd cr_di_no_lambda_a cr_dd_no_lambda_a rr_lambda_c_di \
        rr_lambda_c_dd rr_mu_di rr_mu_dd rr_k rr_lambda_a_di rr_lambda_a_dd)

sbatch /home/p287218/relaxedDAISIE/bash/Hawaii_models/run_Hawaii_${models[SLURM_ARRAY_TASK_ID]}.sh
