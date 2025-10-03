#!/bin/bash

#SBATCH --partition=long
#SBATCH --mem=10G
#SBATCH --time=0-02:00:00
#SBATCH --ntasks=1

#SBATCH --output=%j_%x.out
#SBATCH --error=%j_%x.err

samtools view -b /project/kell7283/linux/2_rnaseq/3_analysis/2_mapping/mapping_cd8_rep3_output.sam |
 samtools sort > /project/kell7283/linux/2_rnaseq/3_analysis/2_mapping/mapping_cd8_rep3_sorted.bam

samtools index /project/kell7283/linux/2_rnaseq/3_analysis/2_mapping/mapping_cd8_rep3_sorted.bam



