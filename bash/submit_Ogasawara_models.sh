#!/bin/bash
#SBATCH --time=72:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=Ogasawara
#SBATCH --output=logs/Ogasawara.log
#SBATCH --mem=5GB
#SBATCH --partition=gelifes

sbatch --job-name=ml_Ogasawara DAISIEutils/bash/submit_run_daisie_ml.sh Ogasawara cr_di_0lac relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Ogasawara DAISIEutils/bash/submit_run_daisie_ml.sh Ogasawara cr_dd_0lac relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Ogasawara DAISIEutils/bash/submit_run_daisie_ml.sh Ogasawara rr_mu_di_0lac relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Ogasawara DAISIEutils/bash/submit_run_daisie_ml.sh Ogasawara rr_mu_dd_0lac relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Ogasawara DAISIEutils/bash/submit_run_daisie_ml.sh Ogasawara rr_k_0lac relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Ogasawara DAISIEutils/bash/submit_run_daisie_ml.sh Ogasawara rr_laa_di_0lac relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Ogasawara DAISIEutils/bash/submit_run_daisie_ml.sh Ogasawara rr_laa_dd_0lac relaxedDAISIE 5
