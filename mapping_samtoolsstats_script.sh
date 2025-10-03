#!/bin/bash

#SBATCH --partition=short
#SBATCH --mem=10G
#SBATCH --ntasks=1
#SBATCH --time=0-01:00:00

#SBATCH --output=%j_%x.out
#SBATCH --error=%j_%x.err


samtools flagstat /project/kell7283/linux/2_rnaseq/3_analysis/2_mapping/mapping_cd8_rep3_sorted.bam >/project/kell7283/linux/2_rnaseq/3_analysis/2_mapping/ mapping_cd8_rep3_sorted.flagstat

samtools idxstats /project/kell7283/linux/2_rnaseq/3_analysis/2_mapping/mapping_cd8_rep3_sorted.bam > /project/kell7283/linux/2_rnaseq/3_analysis/2_mapping/mapping_cd8_rep3_sorted.idxstats
