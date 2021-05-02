#!/bin/bash
#SBATCH --time=72:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=Guam_Marianas
#SBATCH --output=logs/Guam_Marianas.log
#SBATCH --mem=5GB
#SBATCH --partition=gelifes

sbatch --job-name=ml_Guam_Marianas DAISIEutils/bash/submit_run_daisie_ml.sh Guam_Marianas cr_di_0lac relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Guam_Marianas DAISIEutils/bash/submit_run_daisie_ml.sh Guam_Marianas cr_dd_0lac relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Guam_Marianas DAISIEutils/bash/submit_run_daisie_ml.sh Guam_Marianas rr_mu_di_0lac relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Guam_Marianas DAISIEutils/bash/submit_run_daisie_ml.sh Guam_Marianas rr_mu_dd_0lac relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Guam_Marianas DAISIEutils/bash/submit_run_daisie_ml.sh Guam_Marianas rr_k_0lac relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Guam_Marianas DAISIEutils/bash/submit_run_daisie_ml.sh Guam_Marianas rr_laa_di_0lac relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Guam_Marianas DAISIEutils/bash/submit_run_daisie_ml.sh Guam_Marianas rr_laa_dd_0lac relaxedDAISIE 5
