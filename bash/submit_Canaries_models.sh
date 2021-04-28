#!/bin/bash
#SBATCH --time=72:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=Canaries
#SBATCH --output=logs/Canaries.log
#SBATCH --mem=5GB
#SBATCH --partition=gelifes

sbatch --job-name=ml_Canaries DAISIEutils/bash/submit_run_daisie_ml.sh Canaries cr_di relaxedDAISIE 5

sbatch --dependency=singleton --job-name=ml_Canaries DAISIEutils/bash/submit_run_daisie_ml.sh Canaries cr_dd relaxedDAISIE 5

sbatch --dependency=singleton --job-name=ml_Canaries DAISIEutils/bash/submit_run_daisie_ml.sh Canaries rr_lac_di relaxedDAISIE 5

sbatch --dependency=singleton --job-name=ml_Canaries DAISIEutils/bash/submit_run_daisie_ml.sh Canaries rr_lac_dd relaxedDAISIE 5

sbatch --dependency=singleton --job-name=ml_Canaries DAISIEutils/bash/submit_run_daisie_ml.sh Canaries rr_mu_di relaxedDAISIE 5

sbatch --dependency=singleton --job-name=ml_Canaries DAISIEutils/bash/submit_run_daisie_ml.sh Canaries rr_mu_dd relaxedDAISIE 5

sbatch --dependency=singleton --job-name=ml_Canaries DAISIEutils/bash/submit_run_daisie_ml.sh Canaries rr_k relaxedDAISIE 5

sbatch --dependency=singleton --job-name=ml_Canaries DAISIEutils/bash/submit_run_daisie_ml.sh Canaries rr_laa_di relaxedDAISIE 5

sbatch --dependency=singleton --job-name=ml_Canaries DAISIEutils/bash/submit_run_daisie_ml.sh Canaries rr_laa_dd relaxedDAISIE 5
