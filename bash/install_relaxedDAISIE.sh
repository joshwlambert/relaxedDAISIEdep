#!/bin/bash
#SBATCH --time=1:00:00
#SBATCH --partition=gelifes
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=install_relaxedDAISIE
#SBATCH --output=install_relaxedDAISIE.log
#SBATCH --mem=1GB

mkdir -p logs/Aldabra_Group logs/Azores logs/Canaries logs/Cape_Verde \
          logs/Chatham logs/Comoros logs/Galapagos logs/Greater_Antilles \
          logs/Guadalupe logs/Guam_Marianas logs/Hawaii logs/Hispaniola \
          logs/Juan_Fernandez logs/Lord_Howe logs/Madeira logs/Marquesas \
          logs/Mauritius_Island logs/New_Caledonia logs/New_Zealand logs/Niue \
          logs/Norfolk logs/Ogasawara logs/Palau logs/Reunion logs/Samoa \
          logs/SaoTome_Principe logs/Seychelles_Inner logs/Socorro

module load R

Rscript -e 'install.packages("remotes")'
Rscript -e 'remotes::install_github("joshwlambert/relaxedDAISIE")'
