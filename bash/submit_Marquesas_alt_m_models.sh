#!/bin/bash
#SBATCH --time=72:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=Marquesas_alt_m
#SBATCH --output=logs/Marquesas_alt_m.log
#SBATCH --mem=5GB
#SBATCH --partition=gelifes

sbatch --job-name=ml_Marquesas_alt_m DAISIEutils/bash/submit_run_daisie_ml.sh Marquesas_alt_m cr_di relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Marquesas_alt_m DAISIEutils/bash/submit_run_daisie_ml.sh Marquesas_alt_m cr_dd relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Marquesas_alt_m DAISIEutils/bash/submit_run_daisie_ml.sh Marquesas_alt_m rr_lac_di relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Marquesas_alt_m DAISIEutils/bash/submit_run_daisie_ml.sh Marquesas_alt_m rr_lac_dd relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Marquesas_alt_m DAISIEutils/bash/submit_run_daisie_ml.sh Marquesas_alt_m rr_mu_di relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Marquesas_alt_m DAISIEutils/bash/submit_run_daisie_ml.sh Marquesas_alt_m rr_mu_dd relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Marquesas_alt_m DAISIEutils/bash/submit_run_daisie_ml.sh Marquesas_alt_m rr_k relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Marquesas_alt_m DAISIEutils/bash/submit_run_daisie_ml.sh Marquesas_alt_m rr_laa_di relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Marquesas_alt_m DAISIEutils/bash/submit_run_daisie_ml.sh Marquesas_alt_m rr_laa_dd relaxedDAISIE 5
