#!/bin/bash
#SBATCH --time=9-23:00:00
#SBATCH --partition=gelifes
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=Lord_Howe
#SBATCH --output=/home/p287218/relaxedDAISIE/logs/Lord_Howe_models%a.log
#SBATCH --array=0-3
#SBATCH --mem=5GB

mkdir -p results/Lord_Howe
models=(cr_di cr_dd cr_di_no_lambda_c cr_dd_no_lambda_c)

sbatch /home/p287218/relaxedDAISIE/bash/Lord_Howe_models/run_Lord_Howe_${models[SLURM_ARRAY_TASK_ID]}.sh