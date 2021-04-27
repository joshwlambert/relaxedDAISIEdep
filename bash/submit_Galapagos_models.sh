#!/bin/bash
#SBATCH --time=72:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=Galapagos
#SBATCH --output=logs/Galapagos.log
#SBATCH --mem=5GB
#SBATCH --partition=gelifes

sbatch DAISIEutils/bash/submit_run_daisie_ml.sh Galapagos cr_di relaxedDAISIE 5

sbatch --dependency=singleton --job-name=daisie_ml DAISIEutils/bash/submit_run_daisie_ml.sh Galapagos cr_dd relaxedDAISIE 5

sbatch --dependency=singleton --job-name=daisie_ml DAISIEutils/bash/submit_run_daisie_ml.sh Galapagos cr_di_0laa relaxedDAISIE 5

sbatch --dependency=singleton --job-name=daisie_ml DAISIEutils/bash/submit_run_daisie_ml.sh Galapagos cr_dd_0laa relaxedDAISIE 5

sbatch --dependency=singleton --job-name=daisie_ml DAISIEutils/bash/submit_run_daisie_ml.sh Galapagos rr_lac_di relaxedDAISIE 5

sbatch --dependency=singleton --job-name=daisie_ml DAISIEutils/bash/submit_run_daisie_ml.sh Galapagos rr_lac_dd relaxedDAISIE 5

sbatch --dependency=singleton --job-name=daisie_ml DAISIEutils/bash/submit_run_daisie_ml.sh Galapagos rr_mu_di relaxedDAISIE 5

sbatch --dependency=singleton --job-name=daisie_ml DAISIEutils/bash/submit_run_daisie_ml.sh Galapagos rr_mu_dd relaxedDAISIE 5

sbatch --dependency=singleton --job-name=daisie_ml DAISIEutils/bash/submit_run_daisie_ml.sh Galapagos rr_k relaxedDAISIE 5

sbatch --dependency=singleton --job-name=daisie_ml DAISIEutils/bash/submit_run_daisie_ml.sh Galapagos rr_laa_di relaxedDAISIE 5

sbatch --dependency=singleton --job-name=daisie_ml DAISIEutils/bash/submit_run_daisie_ml.sh Galapagos rr_laa_dd relaxedDAISIE 5
