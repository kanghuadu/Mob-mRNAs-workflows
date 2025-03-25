# The sample tissues from LA 0716 (RR and RL)
# Set the path of Genome Reference
index=~/Data/index/Solanum_pennellii/SP
cleandata=~/02_Tomato_Drought_Research/01_Data
## File path
mapdata=~/02_Tomato_Drought_Research/07_mapped_LA_mob
unmapped_fq=~/02_Tomato_Drought_Research/08_unmapped_fq_LA
unmapped_fa=~/02_Tomato_Drought_Research/09_unmapped_fa_LA

## run the mapped 
cat ../01_Data/02.LA.list.txt | awk '{print $1}' | while read i;
do
hisat2 -p 56 --dta --min-intronlen 20 --max-intronlen 500000 --minins 0 --maxins 500 --mp 2,0 -x ${index} -1 ${cleandata}/${i}.clean.1.fq.gz -2 ${cleandata}/${i}.clean.2.fq.gz -S ${mapdata}/${i}.sam &> ${mapdata}/summary/${i}.summary.txt
samtools view -b -f 4 ${mapdata}/${i}.sam > ${mapdata}/${i}.unmapped.bam
samtools fasta ${mapdata}/${i}.unmapped.bam > ${unmapped_fa}/${i}.unmapped.fa
samtools fastq ${mapdata}/${i}.unmapped.bam > ${unmapped_fq}/${i}.unmapped.fq
done