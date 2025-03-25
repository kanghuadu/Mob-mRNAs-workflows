## Second mapped used hisat2, allowing up to one edit distance.
## Upwardly mobile mRNAs workflows.
cat ../01_Data/01.HZ.list.txt | awk '{print $1}' | while read i;
do
hisat2 -p 54 --dta --min-intronlen 20 --max-intronlen 500000 --minins 0 --maxins 500 --mp 1,0 -x ~/Data/index/Solanum_pennellii/SP -U \
    ./11_Upwardly_reads_fq/${i}.upwardly.retain.fq -S ./13_Second_mapped/01_Upwardly_mapped/${i}.upwardly.sam &> ./13_Second_mapped/01_Upwardly_mapped/summary/${i}.summary.txt
# sort
samtools view -bS ./13_Second_mapped/01_Upwardly_mapped/${i}.upwardly.sam > ./13_Second_mapped/01_Upwardly_mapped/${i}.upwardly.mapped.bam
samtools sort -@ 10 ./13_Second_mapped/01_Upwardly_mapped/${i}.upwardly.mapped.bam > ./13_Second_mapped/01_Upwardly_mapped/${i}.upwardly.mapped.sort.bam
# stringtie
stringtie -p 20 -G ~/Data/index/Solanum_pennellii/spenn_v2.0_gene_models_annot.gtf -o ./13_Second_mapped/01_Upwardly_mapped/${i}.upwardly.mapped.sort.gtf \
    ./13_Second_mapped/01_Upwardly_mapped/${i}.upwardly.mapped.sort.bam
done
