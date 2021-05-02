#!/bin/bash
#SBATCH --time=72:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=Palau
#SBATCH --output=logs/Palau.log
#SBATCH --mem=5GB
#SBATCH --partition=gelifes

sbatch --job-name=ml_Palau DAISIEutils/bash/submit_run_daisie_ml.sh Palau cr_di_0lac relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Palau DAISIEutils/bash/submit_run_daisie_ml.sh Palau cr_dd_0lac relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Palau DAISIEutils/bash/submit_run_daisie_ml.sh Palau rr_mu_di_0lac relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Palau DAISIEutils/bash/submit_run_daisie_ml.sh Palau rr_mu_dd_0lac relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Palau DAISIEutils/bash/submit_run_daisie_ml.sh Palau rr_k_0lac relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Palau DAISIEutils/bash/submit_run_daisie_ml.sh Palau rr_laa_di_0lac relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Palau DAISIEutils/bash/submit_run_daisie_ml.sh Palau rr_laa_dd_0lac relaxedDAISIE 5
