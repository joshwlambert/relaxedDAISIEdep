#!/bin/bash
#SBATCH --time=9-23:00:00
#SBATCH --partition=gelifes
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=test_gamma
#SBATCH --output=/home/p287218/relaxedDAISIE/logs/test_gamma_%a.log
#SBATCH --array=1-8
#SBATCH --mem=5GB

mkdir -p results
mkdir -p results/test_gamma
module load R
Rscript /home/p287218/relaxedDAISIE/scripts/test_rr_gamma/test_gamma_${SLURM_ARRAY_TASK_ID}.R
