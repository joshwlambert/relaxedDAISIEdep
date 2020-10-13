#!/bin/bash
#SBATCH --time=2-23:00:00
#SBATCH --partition=gelifes
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=Reunion
#SBATCH --output=/home/p287218/relaxedDAISIE/logs/Reunion_models%a.log
#SBATCH --array=0-3
#SBATCH --mem=5GB

mkdir -p results/Reunion
models=(cr_di cr_dd cr_di_no_lambda_c cr_dd_no_lambda_c)

sbatch /home/p287218/relaxedDAISIE/bash/Reunion_models/run_Reunion_${models[SLURM_ARRAY_TASK_ID]}.sh
