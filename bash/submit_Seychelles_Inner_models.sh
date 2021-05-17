#!/bin/bash
#SBATCH --time=72:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=Seychelles_Inner
#SBATCH --output=logs/Seychelles_Inner.log
#SBATCH --mem=5GB
#SBATCH --partition=gelifes

sbatch --job-name=ml_Seychelles_Inner DAISIEutils/bash/submit_run_daisie_ml_long.sh Seychelles_Inner cr_di_0lac relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Seychelles_Inner DAISIEutils/bash/submit_run_daisie_ml_long.sh Seychelles_Inner cr_dd_0lac relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Seychelles_Inner DAISIEutils/bash/submit_run_daisie_ml_long.sh Seychelles_Inner rr_mu_di_0lac relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Seychelles_Inner DAISIEutils/bash/submit_run_daisie_ml_long.sh Seychelles_Inner rr_mu_dd_0lac relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Seychelles_Inner DAISIEutils/bash/submit_run_daisie_ml_long.sh Seychelles_Inner rr_k_0lac relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Seychelles_Inner DAISIEutils/bash/submit_run_daisie_ml_long.sh Seychelles_Inner rr_laa_di_0lac relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Seychelles_Inner DAISIEutils/bash/submit_run_daisie_ml_long.sh Seychelles_Inner rr_laa_dd_0lac relaxedDAISIE 5
