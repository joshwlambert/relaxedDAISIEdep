#!/bin/bash
#SBATCH --time=72:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=Guadalupe
#SBATCH --output=logs/Guadalupe.log
#SBATCH --mem=5GB
#SBATCH --partition=gelifes

sbatch DAISIEutils/bash/submit_run_daisie_ml.sh Guadalupe cr_di_0lac relaxedDAISIE 5

sbatch --dependency=singleton --job-name=daisie_ml DAISIEutils/bash/submit_run_daisie_ml.sh Guadalupe cr_dd_0lac relaxedDAISIE 5

sbatch --dependency=singleton --job-name=daisie_ml DAISIEutils/bash/submit_run_daisie_ml.sh Guadalupe rr_mu_di_0lac relaxedDAISIE 5

sbatch --dependency=singleton --job-name=daisie_ml DAISIEutils/bash/submit_run_daisie_ml.sh Guadalupe rr_mu_dd_0lac relaxedDAISIE 5

sbatch --dependency=singleton --job-name=daisie_ml DAISIEutils/bash/submit_run_daisie_ml.sh Guadalupe rr_k_0lac relaxedDAISIE 5

sbatch --dependency=singleton --job-name=daisie_ml DAISIEutils/bash/submit_run_daisie_ml.sh Guadalupe rr_laa_di_0lac relaxedDAISIE 5

sbatch --dependency=singleton --job-name=daisie_ml DAISIEutils/bash/submit_run_daisie_ml.sh Guadalupe rr_laa_dd_0lac relaxedDAISIE 5
