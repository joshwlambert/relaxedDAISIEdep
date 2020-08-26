#!/bin/bash
#SBATCH --time=71:00:00
#SBATCH --partition=gelifes
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=rr_approx_cr
#SBATCH --output=rr_approx_cr.out
#SBATCH --mem=5GB

module load R
Rscript run_rr_approx_cr.R
