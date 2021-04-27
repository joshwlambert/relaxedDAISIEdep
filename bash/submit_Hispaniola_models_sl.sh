#!/bin/bash
#SBATCH --time=72:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=Hispaniola
#SBATCH --output=logs/Hispaniola.log
#SBATCH --mem=5GB
#SBATCH --partition=gelifes

sbatch --job-name=ml_Hispaniola DAISIEutils/bash/submit_run_daisie_ml.sh Hispaniola cr_di relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Hispaniola DAISIEutils/bash/submit_run_daisie_ml.sh Hispaniola cr_dd relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Hispaniola DAISIEutils/bash/submit_run_daisie_ml.sh Hispaniola cr_di_0laa relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Hispaniola DAISIEutils/bash/submit_run_daisie_ml.sh Hispaniola cr_dd_0laa relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Hispaniola DAISIEutils/bash/submit_run_daisie_ml.sh Hispaniola rr_lac_di_0laa relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Hispaniola DAISIEutils/bash/submit_run_daisie_ml.sh Hispaniola rr_lac_dd_0laa relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Hispaniola DAISIEutils/bash/submit_run_daisie_ml.sh Hispaniola rr_mu_di_0laa relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Hispaniola DAISIEutils/bash/submit_run_daisie_ml.sh Hispaniola rr_mu_dd_0laa relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Hispaniola DAISIEutils/bash/submit_run_daisie_ml.sh Hispaniola rr_k_0laa relaxedDAISIE 5
