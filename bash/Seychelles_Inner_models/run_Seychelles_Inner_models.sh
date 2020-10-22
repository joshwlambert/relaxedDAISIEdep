#!/bin/bash
#SBATCH --time=2-23:00:00
#SBATCH --partition=gelifes
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=Seychelles_Inner
#SBATCH --output=/data/p287218/relaxedDAISIE/logs/Seychelles_Inner/Seychelles_Inner_models%a.log
#SBATCH --array=0-8
#SBATCH --mem=1GB

mkdir -p inst/results/Seychelles_Inner
models=(cr_di cr_dd cr_di_no_lambda_c cr_dd_no_lambda_c rr_mu_di_no_lambda_c \
        rr_mu_dd_no_lambda_c rr_k_no_lambda_c rr_lambda_a_di_no_lambda_c \
        rr_lambda_a_dd_no_lambda_c)

sbatch /home/p287218/relaxedDAISIE/bash/Seychelles_Inner_models/run_Seychelles_Inner_${models[SLURM_ARRAY_TASK_ID]}.sh
