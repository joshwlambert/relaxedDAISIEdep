#!/bin/bash
#SBATCH --time=72:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=Aldabra_Group
#SBATCH --output=logs/Aldabra_Group.log
#SBATCH --mem=5GB
#SBATCH --partition=gelifes

sbatch --job-name=ml_Aladabra DAISIEutils/bash/submit_run_daisie_ml.sh Aldabra_Group cr_di_0lac relaxedDAISIE 5

sbatch --dependency=singleton --job-name=ml_Aladabra DAISIEutils/bash/submit_run_daisie_ml.sh Aldabra_Group cr_dd_0lac relaxedDAISIE 5

sbatch --dependency=singleton --job-name=ml_Aladabra DAISIEutils/bash/submit_run_daisie_ml.sh Aldabra_Group rr_mu_di_0lac relaxedDAISIE 5

sbatch --dependency=singleton --job-name=ml_Aladabra DAISIEutils/bash/submit_run_daisie_ml.sh Aldabra_Group rr_mu_dd_0lac relaxedDAISIE 5

sbatch --dependency=singleton --job-name=ml_Aladabra DAISIEutils/bash/submit_run_daisie_ml.sh Aldabra_Group rr_k_0lac relaxedDAISIE 5

sbatch --dependency=singleton --job-name=ml_Aladabra DAISIEutils/bash/submit_run_daisie_ml.sh Aldabra_Group rr_laa_di_0lac relaxedDAISIE 5

sbatch --dependency=singleton --job-name=ml_Aladabra DAISIEutils/bash/submit_run_daisie_ml.sh Aldabra_Group rr_laa_dd_0lac relaxedDAISIE 5
