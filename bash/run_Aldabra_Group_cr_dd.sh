#!/bin/bash
#SBATCH --time=9-23:00:00
#SBATCH --partition=gelifes
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=Aldabra_Group
#SBATCH --output=/home/p287218/relaxedDAISIE/logs/Aldabra_Group_cr_dd%a.log
#SBATCH --array=1-10
#SBATCH --mem=5GB

module load R
Rscript /home/p287218/relaxedDAISIE/script/Aldabra_Group/Aldabra_Group_cr_dd.R ${SLURM_ARRAY_TASK_ID}
