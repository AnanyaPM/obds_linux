<u> 02 Oct 2025:  <u>

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









