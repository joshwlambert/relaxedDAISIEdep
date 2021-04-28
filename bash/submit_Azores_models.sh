#!/bin/bash
#SBATCH --time=72:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=Azores
#SBATCH --output=logs/Azores.log
#SBATCH --mem=5GB
#SBATCH --partition=gelifes

sbatch --job-name=ml_Azores DAISIEutils/bash/submit_run_daisie_ml.sh Azores cr_di_0lac relaxedDAISIE 5

sbatch --dependency=singleton --job-name=ml_Azores DAISIEutils/bash/submit_run_daisie_ml.sh Azores cr_dd_0lac relaxedDAISIE 5

sbatch --dependency=singleton --job-name=ml_Azores DAISIEutils/bash/submit_run_daisie_ml.sh Azores rr_mu_di_0lac relaxedDAISIE 5

sbatch --dependency=singleton --job-name=ml_Azores DAISIEutils/bash/submit_run_daisie_ml.sh Azores rr_mu_dd_0lac relaxedDAISIE 5

sbatch --dependency=singleton --job-name=ml_Azores DAISIEutils/bash/submit_run_daisie_ml.sh Azores rr_k_0lac relaxedDAISIE 5

sbatch --dependency=singleton --job-name=ml_Azores DAISIEutils/bash/submit_run_daisie_ml.sh Azores rr_laa_di_0lac relaxedDAISIE 5

sbatch --dependency=singleton --job-name=ml_Azores DAISIEutils/bash/submit_run_daisie_ml.sh Azores rr_laa_dd_0lac relaxedDAISIE 5
