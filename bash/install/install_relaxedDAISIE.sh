#!/bin/bash
#SBATCH --time=1-23:00:00
#SBATCH --partition=gelifes
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=install_relaxedDAISIE
#SBATCH --output=/data/p287218/relaxedDAISIE/install_relaxedDAISIE.log
#SBATCH --mem=1GB

mkdir -p logs
mkdir -p results
ml R
Rscript -e "remotes::install_github('joshwlambert/relaxedDAISIE')"
