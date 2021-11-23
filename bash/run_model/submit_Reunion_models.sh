#!/bin/bash
#SBATCH --time=72:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=Reunion
#SBATCH --output=logs/Reunion.log
#SBATCH --mem=5GB
#SBATCH --partition=gelifes

sbatch --job-name=ml_Reunion DAISIEutils/bash/submit_run_daisie_ml_long.sh Reunion cr_di_0lac relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Reunion DAISIEutils/bash/submit_run_daisie_ml_long.sh Reunion cr_dd_0lac relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Reunion DAISIEutils/bash/submit_run_daisie_ml_long.sh Reunion rr_mu_di_0lac relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Reunion DAISIEutils/bash/submit_run_daisie_ml_long.sh Reunion rr_mu_dd_0lac relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Reunion DAISIEutils/bash/submit_run_daisie_ml_long.sh Reunion rr_k_0lac relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Reunion DAISIEutils/bash/submit_run_daisie_ml_long.sh Reunion rr_laa_di_0lac relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Reunion DAISIEutils/bash/submit_run_daisie_ml_long.sh Reunion rr_laa_dd_0lac relaxedDAISIE 5
