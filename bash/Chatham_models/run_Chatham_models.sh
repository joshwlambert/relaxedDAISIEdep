#!/bin/bash
#SBATCH --time=2-23:00:00
#SBATCH --partition=gelifes
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=Chatham
#SBATCH --output=/data/p287218/relaxedDAISIE/logs/Chatham/Chatham_models%a.log
#SBATCH --array=0-8
#SBATCH --mem=1GB

mkdir -p inst/results/Chatham
models=(cr_di cr_dd cr_di_no_lambda_c cr_dd_no_lambda_c rr_mu_di_no_lambda_c \
        rr_mu_dd_no_lambda_c rr_k_no_lambda_c rr_lambda_a_di_no_lambda_c \
        rr_lambda_a_dd_no_lambda_c)

sbatch /data/p287218/relaxedDAISIE/bash/Chatham_models/run_Chatham_${models[SLURM_ARRAY_TASK_ID]}.sh
