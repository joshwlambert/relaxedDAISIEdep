#!/bin/bash
#SBATCH --time=2-23:00:00
#SBATCH --partition=gelifes
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=Guam_Marianas
#SBATCH --output=/data/p287218/relaxedDAISIE/logs/Guam_Marianas/Guam_Marianas_cr_di%a.log
#SBATCH --array=1-10
#SBATCH --mem=1GB

module load R
Rscript /home/p287218/relaxedDAISIE/scripts/Guam_Marianas_models/Guam_Marianas_cr_di.R ${SLURM_ARRAY_TASK_ID}
