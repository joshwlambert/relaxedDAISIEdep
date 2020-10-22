#!/bin/bash
#SBATCH --time=2-23:00:00
#SBATCH --partition=gelifes
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=Lord_Howe
#SBATCH --output=/data/p287218/relaxedDAISIE/logs/Lord_Howe/Lord_Howe_bootstrap%a.log
#SBATCH --array=1-1000
#SBATCH --mem=1GB

module load R
Rscript /home/p287218/relaxedDAISIE/scripts/Lord_Howe_models/Lord_Howe_bootstrap.R ${SLURM_ARRAY_TASK_ID}
