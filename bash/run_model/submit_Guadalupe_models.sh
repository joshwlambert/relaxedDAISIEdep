#!/bin/bash
#SBATCH --time=72:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=Guadalupe
#SBATCH --output=logs/Guadalupe.log
#SBATCH --mem=5GB
#SBATCH --partition=gelifes

sbatch --job-name=ml_Guadalupe DAISIEutils/bash/submit_run_daisie_ml_long.sh Guadalupe cr_di_0lac relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Guadalupe DAISIEutils/bash/submit_run_daisie_ml_long.sh Guadalupe cr_dd_0lac relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Guadalupe DAISIEutils/bash/submit_run_daisie_ml_long.sh Guadalupe rr_mu_di_0lac relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Guadalupe DAISIEutils/bash/submit_run_daisie_ml_long.sh Guadalupe rr_mu_dd_0lac relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Guadalupe DAISIEutils/bash/submit_run_daisie_ml_long.sh Guadalupe rr_k_0lac relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Guadalupe DAISIEutils/bash/submit_run_daisie_ml_long.sh Guadalupe rr_laa_di_0lac relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Guadalupe DAISIEutils/bash/submit_run_daisie_ml_long.sh Guadalupe rr_laa_dd_0lac relaxedDAISIE 5
