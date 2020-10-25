#!/bin/bash
#SBATCH --time=2-23:00:00
#SBATCH --partition=gelifes
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=Palau
#SBATCH --output=/data/p287218/relaxedDAISIE/logs/Palau/Palau_cr_dd%a.log
#SBATCH --array=1-10
#SBATCH --mem=1GB

module load R
Rscript /data/p287218/relaxedDAISIE/scripts/Palau_models/Palau_cr_dd.R ${SLURM_ARRAY_TASK_ID}
