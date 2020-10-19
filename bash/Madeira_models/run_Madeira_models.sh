#!/bin/bash
#SBATCH --time=2-23:00:00
#SBATCH --partition=gelifes
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=Madeira
#SBATCH --output=/home/p287218/relaxedDAISIE/logs/Madeira/Madeira_models%a.log
#SBATCH --array=0-8
#SBATCH --mem=5GB

mkdir -p inst/results/Madeira
models=(cr_di cr_dd cr_di_no_lambda_c cr_dd_no_lambda_c rr_mu_di_no_lambda_c \
        rr_mu_dd_no_lambda_c rr_k_no_lambda_c rr_lambda_a_di_no_lambda_c \
        rr_lambda_a_dd_no_lambda_c)

sbatch /home/p287218/relaxedDAISIE/bash/Madeira_models/run_Madeira_${models[SLURM_ARRAY_TASK_ID]}.sh
