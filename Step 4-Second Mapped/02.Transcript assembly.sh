# merge *.gtf file 
stringtie --merge -F 0 -T 0 -G ~/Data/index/Solanum_pennellii/spenn_v2.0_gene_models_annot.gtf -o ./Upwardly.merged.gtf mergelist.txt

# Annotation using gffcompare software
gffcompare -r ~/Data/index/Solanum_pennellii/spenn_v2.0_gene_models_annot.gtf -G -o ./merged Upwardly.merged.gtf

# Calculate the count value of upwardly mobile reads
featureCounts -T 5  -t exon -g transcript_id -a ../01.upwardly_gffcompare/Upwardly.merged.gtf -o 01.upwardly.count.txt ../*.upwardly.mapped.sort.bam

##--------------------------------------------------------------------------------------------------------

# Note: the identiftion of downwardly mobile mRNAs were used same pipline. 