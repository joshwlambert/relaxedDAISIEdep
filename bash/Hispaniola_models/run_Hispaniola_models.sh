#!/bin/bash
#SBATCH --time=2-23:00:00
#SBATCH --partition=gelifes
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=Hispaniola
#SBATCH --output=/data/p287218/relaxedDAISIE/logs/Hispaniola/Hispaniola_models%a.log
#SBATCH --array=0-8
#SBATCH --mem=1GB

mkdir -p inst/results/Hispaniola
models=(cr_di cr_dd cr_di_no_lambda_a cr_dd_no_lambda_a rr_lambda_c_no_lambda_a \
        rr_lambda_c_no_lambda_a rr_mu_di_no_lambda_a rr_mu_dd_no_lambda_a \
        rr_k_no_lambda_a)

sbatch /home/p287218/relaxedDAISIE/bash/Hispaniola_models/run_Hispaniola_${models[SLURM_ARRAY_TASK_ID]}.sh
