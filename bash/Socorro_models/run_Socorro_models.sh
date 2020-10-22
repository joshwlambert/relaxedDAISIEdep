#!/bin/bash
#SBATCH --time=2-23:00:00
#SBATCH --partition=gelifes
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=Socorro
#SBATCH --output=/home/p287218/relaxedDAISIE/logs/Socorro/Socorro_models%a.log
#SBATCH --array=0-3
#SBATCH --mem=1GB

mkdir -p inst/results/Socorro
models=(cr_di cr_dd cr_di_no_lambda_c cr_dd_no_lambda_c)

sbatch /home/p287218/relaxedDAISIE/bash/Socorro_models/run_Socorro_${models[SLURM_ARRAY_TASK_ID]}.sh
