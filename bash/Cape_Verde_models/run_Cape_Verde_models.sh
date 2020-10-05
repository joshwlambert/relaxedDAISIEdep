#!/bin/bash
#SBATCH --time=9-23:00:00
#SBATCH --partition=gelifes
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=Cape_Verde
#SBATCH --output=/home/p287218/relaxedDAISIE/logs/Cape_Verde_models%a.log
#SBATCH --array=0-8
#SBATCH --mem=5GB

mkdir -p results/Cape_Verde
models=(cr_di cr_dd cr_di_no_lambda_c cr_dd_no_lambda_c rr_mu_di_no_lambda_c \
        rr_mu_dd_no_lambda_c rr_k_no_lambda_c rr_lambda_a_di_no_lambda_c \
        rr_lambda_a_dd_no_lambda_c)

sbatch /home/p287218/relaxedDAISIE/bash/Cape_Verde_models/run_Cape_Verde_${models[SLURM_ARRAY_TASK_ID]}.sh
