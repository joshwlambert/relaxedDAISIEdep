#!/bin/bash
#SBATCH --time=9-23:00:00
#SBATCH --partition=gelifes
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=island_models
#SBATCH --output=/data/p287218/relaxedDAISIE/logs/island_models%a.log
#SBATCH --array=0-20
#SBATCH --mem=1GB

models=(Aldabra_Group Azores Canaries Cape_Verde Chatham Comoros Galapagos \
        Greater_Antilles Guadalupe Guam_Marianas Hawaii Hispaniola \
        Juan_Fernandez Lord_Howe Madeira Marquesas Mauritius_Island \
        New_Caledonia New_Zealand Niue Norfolk Ogasawara Palau Reunion Samoa \
        SaoTome_Principe Seychelles_Inner Socorro)
mkdir -p inst/results/${models[SLURM_ARRAY_TASK_ID]}
sbatch /home/p287218/relaxedDAISIE/bash/${models[SLURM_ARRAY_TASK_ID]}/run_${models[SLURM_ARRAY_TASK_ID]}_models.sh
