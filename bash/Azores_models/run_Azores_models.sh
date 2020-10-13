#!/bin/bash
#SBATCH --time=2-23:00:00
#SBATCH --partition=gelifes
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=Azores
#SBATCH --output=/home/p287218/relaxedDAISIE/logs/Azores/Azores_models%a.log
#SBATCH --array=0-8
#SBATCH --mem=5GB

mkdir -p results/Azores
models=(cr_di cr_dd cr_di_no_lambda_c cr_dd_no_lambda_c rr_mu_di_no_lambda_c \
        rr_mu_dd_no_lambda_c rr_k_no_lambda_c rr_lambda_a_di_no_lambda_c \
        rr_lambda_a_dd_no_lambda_c)

sbatch /home/p287218/relaxedDAISIE/bash/Azores_models/run_Azores_${models[SLURM_ARRAY_TASK_ID]}.sh
