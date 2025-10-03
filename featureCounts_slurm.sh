#!/bin/bash

#SBATCH --partition=long
#SBATCH --mem=10G
#SBATCH --ntasks=4
#SBATCH --time=0-02:00:00

#SBATCH --output=%j_%x.out
#SBATCH --error=%j_%x.err

featureCounts -T 4 -t exon -g gene_id -p --countReadPairs -s 1 \
 -a /project/kell7283/linux/2_rnaseq/2_genome/Mus_musculus.GRCm39.115.gtf.gz \
 -o /project/kell7283/linux/2_rnaseq/3_analysis/featureCounts_reports/cd8_rep3_Fstrand_counts.txt \
 /project/kell7283/linux/2_rnaseq/3_analysis/2_mapping/mapping_cd8_rep3_sorted.bam

featureCounts -T 4 -t exon -g gene_id -p --countReadPairs -s 2 \
-a /project/kell7283/linux/2_rnaseq/2_genome/Mus_musculus.GRCm39.115.gtf.gz \
-o /project/kell7283/linux/2_rnaseq/3_analysis/featureCounts_reports/cd8_rep3_Rstrand_counts.txt \
 /project/kell7283/linux/2_rnaseq/3_analysis/2_mapping/mapping_cd8_rep3_sorted.bam
