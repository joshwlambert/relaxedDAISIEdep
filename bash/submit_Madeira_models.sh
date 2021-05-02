#!/bin/bash
#SBATCH --time=72:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=Madeira
#SBATCH --output=logs/Madeira.log
#SBATCH --mem=5GB
#SBATCH --partition=gelifes

sbatch --job-name=ml_Madeira DAISIEutils/bash/submit_run_daisie_ml.sh Madeira cr_di_0lac relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Madeira DAISIEutils/bash/submit_run_daisie_ml.sh Madeira cr_dd_0lac relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Madeira DAISIEutils/bash/submit_run_daisie_ml.sh Madeira rr_mu_di_0lac relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Madeira DAISIEutils/bash/submit_run_daisie_ml.sh Madeira rr_mu_dd_0lac relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Madeira DAISIEutils/bash/submit_run_daisie_ml.sh Madeira rr_k_0lac relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Madeira DAISIEutils/bash/submit_run_daisie_ml.sh Madeira rr_laa_di_0lac relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Madeira DAISIEutils/bash/submit_run_daisie_ml.sh Madeira rr_laa_dd_0lac relaxedDAISIE 5
