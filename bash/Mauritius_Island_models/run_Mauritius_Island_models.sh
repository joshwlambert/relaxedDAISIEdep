#!/bin/bash
#SBATCH --time=2-23:00:00
#SBATCH --partition=gelifes
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=Mauritius_Island
#SBATCH --output=/home/p287218/relaxedDAISIE/logs/Mauritius_Island/Mauritius_Island_models%a.log
#SBATCH --array=0-3
#SBATCH --mem=1GB

mkdir -p inst/results/Mauritius_Island
models=(cr_di cr_dd cr_di_no_lambda_c cr_dd_no_lambda_c)

sbatch /home/p287218/relaxedDAISIE/bash/Mauritius_Island_models/run_Mauritius_Island_${models[SLURM_ARRAY_TASK_ID]}.sh
