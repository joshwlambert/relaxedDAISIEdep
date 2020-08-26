#!/bin/bash
#SBATCH --time=71:00:00
#SBATCH --partition=gelifes
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=Aldabra_Group_models
#SBATCH --output=logs/Aldabra_Group_models.log
#SBATCH --mem=5GB

mkdir -p results
mkdir -p logs

module load R
Rscript Aldabra_Group_models.R
