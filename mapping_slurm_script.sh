≈#!/bin/bash

#SBATCH --partition=long
#SBATCH --mem=10G
#SBATCH --ntasks=8
#SBATCH --time=0-01:00:00
#SBATCH --output=%j_%x.out
#SBATCH --error=%j_%x.err



hisat2 --threads 8\
 -x /project/shared/linux/5_rnaseq/hisat2_index/grcm39\
 -1 /project/kell7283/linux/2_rnaseq/1_fastq/cd8_rep3_read1.fastq.gz\
 -2 /project/kell7283/linux/2_rnaseq/1_fastq/cd8_rep3_read2.fastq.gz\
 --rna-strandness RF\
 --summary-file mapping_stats.txt\
 -S /project/kell7283/linux/2_rnaseq/3_analysis/2_mapping/mapping_cd8_rep3_output.sam





