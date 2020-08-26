#!/bin/bash
#SBATCH --time=71:00:00
#SBATCH --partition=gelifes
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=rr_approx_cr
#SBATCH --output=logs/rr_approx_cr.log
#SBATCH --mem=5GB

mkdir -p results
mkdir -p logs

module load R
Rscript run_rr_approach_cr.R
