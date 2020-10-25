#!/bin/bash
#SBATCH --time=2-23:00:00
#SBATCH --partition=gelifes
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=Lord_Howe
#SBATCH --output=/data/p287218/relaxedDAISIE/logs/Lord_Howe/Lord_Howe_cr_di%a.log
#SBATCH --array=1-10
#SBATCH --mem=1GB

module load R
Rscript /data/p287218/relaxedDAISIE/scripts/Lord_Howe_models/Lord_Howe_cr_di.R ${SLURM_ARRAY_TASK_ID}
