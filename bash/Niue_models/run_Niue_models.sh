#!/bin/bash
#SBATCH --time=2-23:00:00
#SBATCH --partition=gelifes
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=Niue
#SBATCH --output=/data/p287218/relaxedDAISIE/logs/Niue/Niue_models%a.log
#SBATCH --array=0-3
#SBATCH --mem=1GB

mkdir -p inst/results/Niue
models=(cr_di cr_dd cr_di_no_lambda_c cr_dd_no_lambda_c)

sbatch /data/p287218/relaxedDAISIE/bash/Niue_models/run_Niue_${models[SLURM_ARRAY_TASK_ID]}.sh
