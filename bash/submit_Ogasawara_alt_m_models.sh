#!/bin/bash
#SBATCH --time=72:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=Ogasawara_alt_m
#SBATCH --output=logs/Ogasawara_alt_m.log
#SBATCH --mem=5GB
#SBATCH --partition=gelifes

sbatch --job-name=ml_Ogasawara_alt_m DAISIEutils/bash/submit_run_daisie_ml_long.sh Ogasawara_alt_m cr_di_0lac relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Ogasawara_alt_m DAISIEutils/bash/submit_run_daisie_ml_long.sh Ogasawara_alt_m cr_dd_0lac relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Ogasawara_alt_m DAISIEutils/bash/submit_run_daisie_ml_long.sh Ogasawara_alt_m rr_mu_di_0lac relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Ogasawara_alt_m DAISIEutils/bash/submit_run_daisie_ml_long.sh Ogasawara_alt_m rr_mu_dd_0lac relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Ogasawara_alt_m DAISIEutils/bash/submit_run_daisie_ml_long.sh Ogasawara_alt_m rr_k_0lac relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Ogasawara_alt_m DAISIEutils/bash/submit_run_daisie_ml_long.sh Ogasawara_alt_m rr_laa_di_0lac relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Ogasawara_alt_m DAISIEutils/bash/submit_run_daisie_ml_long.sh Ogasawara_alt_m rr_laa_dd_0lac relaxedDAISIE 5
