#!/bin/bash
#SBATCH --time=1:00:00
#SBATCH --partition=gelifes
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=install_relaxedDAISIE
#SBATCH --output=install_relaxedDAISIE.log
#SBATCH --mem=1GB

mkdir -p log/Aldabra_Group log/Azores log/Canaries log/Cape_Verde log/Chatham \
          log/Comoros log/Galapagos log/Greater_Antilles log/Guadalupe \
          log/Guam_Marianas log/Hawaii log/Hispaniola log/Juan_Fernandez \
          log/Lord_Howe log/Madeira log/Marquesas log/Mauritius_Island \
          log/New_Caledonia log/New_Zealand log/Niue log/Norfolk log/Ogasawara \
          log/Palau log/Reunion log/Samoa log/SaoTome_Principe \
          log/Seychelles_Inner log/Socorro

module load R

Rscript -e 'install.packages("remotes")'
Rscript -e 'remotes::install_github("joshwlambert/relaxedDAISIE")'
