# The sample tissues from Heinz 1706 (HL)
index=~/Data/index/Tomato_index_4.0/Sl_4.0
gtf=~/Data/index/Tomato_index_4.0/ITAG4.0_gene_models.gff
#
rawdata=~/02_Tomato_Drought_Research/01_Data
cleandata=~/02_Tomato_Drought_Research/01_clean_fq
#
unmappedHZ_fq=~/02_Tomato_Drought_Research/05_unmapped_fq_HZ
unmappedHZ_fa=~/02_Tomato_Drought_Research/06_unmapped_fa_HZ

cat ../01_Data/01.HZ.list.txt | awk '{print $1}' | while read i;
do
# mapped 
        hisat2 -p 56 --dta --min-intronlen 20 --max-intronlen 500000 --minins 0 --maxins 500  -x ${index} -1 ${cleandata}/${i}_1.clean.fq.gz -2 ${cleandata}/${i}_2.clean.fq.gz -S ${mapdata}/${i}.sam &> ${mapdata}/summary/${i}.summary.txt
        ## mapped reads
        samtools view -bS ${mapdata}/${i}.sam > ${mapdata}/${i}.bam
        samtools sort -@ 10 ${mapdata}/${i}.bam > ${mapdata}/${i}.sorted.bam
        ## unmapped reads
        samtools view -b -f 4 ${mapdata}/${i}.sam > ${mapdata}/${i}.unmapped.bam
        ## unmapped read, bam to fa or fq
        samtools fasta ${mapdata}/${i}.unmapped.bam > ${unmappedHZ_fa}/${i}.unmapped.fa
        samtools fastq ${mapdata}/${i}.unmapped.bam > ${unmappedHZ_fq}/${i}.unmapped.fq
done
