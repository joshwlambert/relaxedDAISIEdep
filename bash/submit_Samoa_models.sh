#!/bin/bash
#SBATCH --time=72:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=Samoa
#SBATCH --output=logs/Samoa.log
#SBATCH --mem=5GB
#SBATCH --partition=gelifes

sbatch --job-name=ml_Samoa DAISIEutils/bash/submit_run_daisie_ml.sh Samoa cr_di_0lac relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Samoa DAISIEutils/bash/submit_run_daisie_ml.sh Samoa cr_dd_0lac relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Samoa DAISIEutils/bash/submit_run_daisie_ml.sh Samoa rr_mu_di_0lac relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Samoa DAISIEutils/bash/submit_run_daisie_ml.sh Samoa rr_mu_dd_0lac relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Samoa DAISIEutils/bash/submit_run_daisie_ml.sh Samoa rr_k_0lac relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Samoa DAISIEutils/bash/submit_run_daisie_ml.sh Samoa rr_laa_di_0lac relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Samoa DAISIEutils/bash/submit_run_daisie_ml.sh Samoa rr_laa_dd_0lac relaxedDAISIE 5
