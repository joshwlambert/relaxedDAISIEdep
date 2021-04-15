#!/bin/bash
#SBATCH --time=72:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=Aldabra_Group
#SBATCH --output=logs/DAISIE/Aldabra_Group.log
#SBATCH --mem=5GB
#SBATCH --partition=gelifes

sbatch DAISIEutils/bash/submit_run_daisie_ml.sh Aldabra_Group cr_di relaxedDAISIE 5

