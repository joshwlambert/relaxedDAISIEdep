#!/bin/bash
#SBATCH --time=2-23:00:00
#SBATCH --partition=gelifes
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=Juan_Fernandez
#SBATCH --output=/data/p287218/relaxedDAISIE/logs/Juan_Fernandez/Juan_Fernandez_models%a.log
#SBATCH --array=0-1
#SBATCH --mem=1GB

mkdir -p inst/results/Juan_Fernandez
models=(cr_di cr_dd)

sbatch /data/p287218/relaxedDAISIE/bash/Juan_Fernandez_models/run_Juan_Fernandez_${models[SLURM_ARRAY_TASK_ID]}.sh
