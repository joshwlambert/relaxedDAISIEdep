#!/bin/bash
#SBATCH --time=72:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=Lord_Howe
#SBATCH --output=logs/Lord_Howe.log
#SBATCH --mem=5GB
#SBATCH --partition=gelifes

sbatch --job-name=ml_Lord_Howe DAISIEutils/bash/submit_run_daisie_ml.sh Lord_Howe cr_di_0lac relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Lord_Howe DAISIEutils/bash/submit_run_daisie_ml.sh Lord_Howe cr_dd_0lac relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Lord_Howe DAISIEutils/bash/submit_run_daisie_ml.sh Lord_Howe rr_mu_di_0lac relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Lord_Howe DAISIEutils/bash/submit_run_daisie_ml.sh Lord_Howe rr_mu_dd_0lac relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Lord_Howe DAISIEutils/bash/submit_run_daisie_ml.sh Lord_Howe rr_k_0lac relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Lord_Howe DAISIEutils/bash/submit_run_daisie_ml.sh Lord_Howe rr_laa_di_0lac relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Lord_Howe DAISIEutils/bash/submit_run_daisie_ml.sh Lord_Howe rr_laa_dd_0lac relaxedDAISIE 5
