#!/bin/bash
#SBATCH --time=9-23:00:00
#SBATCH --partition=gelifes
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=island_models
#SBATCH --output=/home/p287218/relaxedDAISIE/logs/island_models%a.log
#SBATCH --array=0-20
#SBATCH --mem=5GB

module load R
models=(Aldabra_Group Azores Canaries Cape_Verde Chatham Comoros Galapagos \
        Greater_Antilles Guadalupe Guam_Marianas Hawaii Hispaniola Madeira \
        Marquesas New_Caledonia New_Zealand Norfolk Palau Samoa SaoTome_Principe \
        Seychelles_Inner)
mkdir -p results/${models[SLURM_ARRAY_TASK_ID]}
sbatch /home/p287218/relaxedDAISIE/bash/run_${models[SLURM_ARRAY_TASK_ID]}_models.sh
