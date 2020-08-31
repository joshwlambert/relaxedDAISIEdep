#!/bin/bash
#SBATCH --time=9-23:00:00
#SBATCH --partition=gelifes
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=Aldabra_Group_cr_di
#SBATCH --output=/home/p287218/relaxedDAISIE/logs/Aldabra_Group_cr_di.log
#SBATCH --mem=5GB

module load R
Rscript /home/p287218/relaxedDAISIE/scripts/Aldabra_Group_models/Aldabra_Group_cr_di.R
