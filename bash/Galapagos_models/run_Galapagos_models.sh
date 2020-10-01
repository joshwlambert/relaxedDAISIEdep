#!/bin/bash
#SBATCH --time=9-23:00:00
#SBATCH --partition=gelifes
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=Galapagos_models
#SBATCH --output=/home/p287218/relaxedDAISIE/logs/Galapagos_models.log
#SBATCH --mem=5GB

module load R
Rscript /home/p287218/relaxedDAISIE/scripts/Galapagos_models.R
