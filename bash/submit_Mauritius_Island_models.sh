#!/bin/bash
#SBATCH --time=72:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=Mauritius_Island
#SBATCH --output=logs/Mauritius_Island.log
#SBATCH --mem=5GB
#SBATCH --partition=gelifes

sbatch --job-name=ml_Mauritius_Island DAISIEutils/bash/submit_run_daisie_ml.sh Mauritius_Island cr_di_0lac relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Mauritius_Island DAISIEutils/bash/submit_run_daisie_ml.sh Mauritius_Island cr_dd_0lac relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Mauritius_Island DAISIEutils/bash/submit_run_daisie_ml.sh Mauritius_Island rr_mu_di_0lac relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Mauritius_Island DAISIEutils/bash/submit_run_daisie_ml.sh Mauritius_Island rr_mu_dd_0lac relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Mauritius_Island DAISIEutils/bash/submit_run_daisie_ml.sh Mauritius_Island rr_k_0lac relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Mauritius_Island DAISIEutils/bash/submit_run_daisie_ml.sh Mauritius_Island rr_laa_di_0lac relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Mauritius_Island DAISIEutils/bash/submit_run_daisie_ml.sh Mauritius_Island rr_laa_dd_0lac relaxedDAISIE 5
