#!/bin/bash
#SBATCH --time=1:00:00
#SBATCH --partition=gelifes
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=install_relaxedDAISIE
#SBATCH --output=logs/rr_approx_cr.log
#SBATCH --mem=1GB

mkdir -p logs

module load R

Rscript -e 'devtools::install.github("joshwlambert/relaxedDAISIE")'
