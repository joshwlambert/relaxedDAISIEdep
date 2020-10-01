#!/bin/bash
#SBATCH --time=9-23:00:00
#SBATCH --partition=gelifes
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=Juan_Fernandez
#SBATCH --output=/home/p287218/relaxedDAISIE/logs/Juan_Fernandez_cr_dd%a.log
#SBATCH --array=1-10
#SBATCH --mem=5GB

module load R
Rscript /home/p287218/relaxedDAISIE/scripts/Juan_Fernandez_models/Juan_Fernandez_cr_dd.R ${SLURM_ARRAY_TASK_ID}
