<ins>02 Oct 2025:</ins>  

##FASTQC
Fast QC on cd8_rep3 reads:
(obds-rnaseq) kell7283@obds:/project/kell7283/linux/2_rnaseq$ fastqc -h #to find which arguments are to be used
(obds-rnaseq) kell7283@obds:/project/kell7283/linux/2_rnaseq$ fastqc 1_fastq/cd8_rep3_read1.fastq.gz 1_fastq/cd8_rep3_read2.fastq.gz -o 3_analysis/1_fastqc  #running fastqc on both .fastqc.gz files  and output (-o) to 3_analysis/1_fastqc
(obds-rnaseq) kell7283@obds:/project/kell7283/linux/2_rnaseq$ ls -l 3_analysis/1_fastqc  #checking output files present

to download  the html files to view on web browser: 
#option 1 is filezilla
#option 2 : new terminal of just laptop space, not cluster and then:
ananyamahadevan@Ananyas-MacBook-Air ~ % cd Downloads 
ananyamahadevan@Ananyas-MacBook-Air Downloads % scp obds:/project/kell7283/linux/2_rnaseq/3_analysis/reports/multiqc_report.html .  #(the last . is to save in the current folder, which is the Downloads folder)
#option 3 : new terminal of laptop space, using rsync instead of scp command 
rsync obds:/project/kell7283/linux/2_rnaseq/3_analysis/reports/multiqc_report.html Downloads/

run multiqc on the qc'ed files (the outputs)
(obds-rnaseq) kell7283@obds:/project/kell7283/linux/2_rnaseq$ multiqc -h
(obds-rnaseq) kell7283@obds:/project/kell7283/linux/2_rnaseq$ mkdir 3_analysis/reports  #make new directory called "reports" for output files
(obds-rnaseq) kell7283@obds:/project/kell7283/linux/2_rnaseq$ cd 3_analysis/reports  #move to reports folder
(obds-rnaseq) kell7283@obds:/project/kell7283/linux/2_rnaseq/3_analysis/reports$ multiqc ../1_fastqc # run multiqc on all files in the 1_fastqc folder 
#add this to specify output folder, so you need not be in it:  -o (obds-rnaseq) kell7283@obds:/project/kell7283/linux/2_rnaseq/3_analysis/reports

**ON SLURM:** 
run the fastqc command on slurm:
#copy the given slurm template:
(obds-rnaseq) kell7283@obds:/project/kell7283/linux/2_rnaseq/3_analysis/1_fastqc$ cp /project/shared/linux/4_slurm/slurm_template.sh .

# make new directory to put the slurm derived output files (to keep them separate from the fastqc from above)
(obds-rnaseq) kell7283@obds:/project/kell7283/linux/2_rnaseq/3_analysis$ mkdir slurm_output
(obds-rnaseq) kell7283@obds:/project/kell7283/linux/2_rnaseq/3_analysis$ cd slurm_output 

#edit the slurm_template.sh on nano: (to change the output path and input files in fastqc command) [ensure --threads and cpu requested is same]
fastqc  --nogroup --threads 2 --extract -o  /project/kell7283/linux/2_rnaseq/3_analysis/slurm_output /project/kell7283/linux/2_rnaseq/1_fastq/*.fastq.gz

#run on slurm:
(obds-rnaseq) kell7283@obds:/project/kell7283/linux/2_rnaseq/3_analysis/slurm_output$ sbatch /project/kell7283/linux/2_rnaseq/3_analysis/1_fastqc/slurm_template.sh 

#monitor job:
(obds-rnaseq) kell7283@obds:/project/kell7283/linux/2_rnaseq/3_analysis/slurm_output$ sinfo
(obds-rnaseq) kell7283@obds:/project/kell7283/linux/2_rnaseq/3_analysis/slurm_output$ squeue
(obds-rnaseq) kell7283@obds:/project/kell7283/linux/2_rnaseq/3_analysis/slurm_output$ watch squeue --me
#with this last command, it creates a continually updating system to track time elapsed. Need to quit to continue using terminal

#look at output err and out log files
(obds-rnaseq) kell7283@obds:/project/kell7283/linux/2_rnaseq/3_analysis/slurm_output$ less 563_slurm_template.sh.err 
(obds-rnaseq) kell7283@obds:/project/kell7283/linux/2_rnaseq/3_analysis/slurm_output$ less 563_slurm_template.sh.out


##HISAT2 ON SLURM

hisat2 --threads 8\
 -x /project/shared/linux/5_rnaseq/hisat2_index/grcm39\
 -1 /project/kell7283/linux/2_rnaseq/1_fastq/cd8_rep3_read1.fastq.gz\
 -2 /project/kell7283/linux/2_rnaseq/1_fastq/cd8_rep3_read2.fastq.gz\
 --rna-strandness RF\
 --summary-file mapping_stats.txt\
 -S /project/kell7283/linux/2_rnaseq/3_analysis/2_mapping/mapping_cd8_rep3_output.sam














