#!/bin/bash
#SBATCH --time=72:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=Juan_Fernandez
#SBATCH --output=logs/Juan_Fernandez.log
#SBATCH --mem=5GB
#SBATCH --partition=gelifes

sbatch --job-name=ml_Juan_Fernandez DAISIEutils/bash/submit_run_daisie_ml.sh Juan_Fernandez cr_di_0lac relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Juan_Fernandez DAISIEutils/bash/submit_run_daisie_ml.sh Juan_Fernandez cr_dd_0lac relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Juan_Fernandez DAISIEutils/bash/submit_run_daisie_ml.sh Juan_Fernandez rr_mu_di_0lac relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Juan_Fernandez DAISIEutils/bash/submit_run_daisie_ml.sh Juan_Fernandez rr_mu_dd_0lac relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Aladabra DAISIEutils/bash/submit_run_daisie_ml.sh Juan_Fernandez rr_k_0lac relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Juan_Fernandez DAISIEutils/bash/submit_run_daisie_ml.sh Juan_Fernandez rr_laa_di_0lac relaxedDAISIE 5

sleep 5

sbatch --job-name=ml_Juan_Fernandez DAISIEutils/bash/submit_run_daisie_ml.sh Juan_Fernandez rr_laa_dd_0lac relaxedDAISIE 5
