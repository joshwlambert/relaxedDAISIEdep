#!/bin/bash
#SBATCH --time=9-23:00:00
#SBATCH --partition=gelifes
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=run_performance
#SBATCH --output=/home/p287218/relaxedDAISIE/logs/run_performance%a%j.log
#SBATCH --array=1-10
#SBATCH --mem=5GB

# sim_model and ml_model should be one of: cr, rr_lambda_c, rr_mu, rr_k, rr_lambda_a
# cr = constant rate model
# rr_lambda_c = relaxed-rate cladogenesis model
# rr_mu = relaxed-rate extinction model
# rr_k = relaxed-rate carrying capacity model
# rr_lambda_a = relaxed-rate anagenesis model

#example: sbatch run_performance_analysis.sh rr_lambda_c rr_lambda_a

sim_model=$1
ml_model=$2

mkdir -p results/performance_analysis

module load R

Rscript /home/p287218/relaxedDAISIE/scripts/performance_analysis.R ${SLURM_ARRAY_TASK_ID} \
                                                                   ${sim_model} \
                                                                   ${ml_model}
