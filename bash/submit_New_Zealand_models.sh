#!/bin/bash
#SBATCH --time=72:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=New_Zealand
#SBATCH --output=logs/New_Zealand.log
#SBATCH --mem=5GB
#SBATCH --partition=gelifes

sbatch --job-name=ml_New_Zealand DAISIEutils/bash/submit_run_daisie_ml_long.sh New_Zealand cr_di relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_New_Zealand DAISIEutils/bash/submit_run_daisie_ml_long.sh New_Zealand cr_dd relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_New_Zealand DAISIEutils/bash/submit_run_daisie_ml_long.sh New_Zealand rr_lac_di relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_New_Zealand DAISIEutils/bash/submit_run_daisie_ml_long.sh New_Zealand rr_lac_dd relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_New_Zealand DAISIEutils/bash/submit_run_daisie_ml_long.sh New_Zealand rr_mu_di relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_New_Zealand DAISIEutils/bash/submit_run_daisie_ml_long.sh New_Zealand rr_mu_dd relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_New_Zealand DAISIEutils/bash/submit_run_daisie_ml_long.sh New_Zealand rr_k relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_New_Zealand DAISIEutils/bash/submit_run_daisie_ml_long.sh New_Zealand rr_laa_di relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_New_Zealand DAISIEutils/bash/submit_run_daisie_ml_long.sh New_Zealand rr_laa_dd relaxedDAISIE 5
