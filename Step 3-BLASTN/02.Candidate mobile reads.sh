# BLASTN 
# candidate upwardly reads (A) (rootstock to Scion)
cat ../../../01_Data/01.HZ.list.txt | awk '{print $1}' | while read i;
do
blastn -db ~/Data/index/Diamond_BLAST/Tomato_4.0/Sl_4.0 -max_target_seqs 3 -evalue 1e-5 -outfmt 6 -num_threads 56 -query ../../06_unmapped_fa_HZ/${i}.unmapped.fa -out ./01.Blast_Tomato/${i}.m6 
## False positive reads (B)
blastn -db ~/Data/index/Diamond_BLAST/SP_V2/SP -max_target_seqs 3 -evalue 1e-5 -outfmt 6 -num_threads 56 -query ../../06_unmapped_fa_HZ/${i}.unmapped.fa -out ./02_Blast_SP/${i}.sp.m6
done

##------------------------------------------------------------------------------
##------------------------------------------------------------------------------
# candidate downwardly reads (A')
cat ../../../01_Data/02.LA.list.txt | awk '{print $1}' | while read i; 
do 
blastn -db ~/Data/index/Diamond_BLAST/Tomato_4.0/Sl_4.0 -max_target_seqs 3 -evalue 1e-5 -outfmt 6 -num_threads 56 -query ../../09_unmapped_fa_LA/${i}.unmapped.fa -out ./01_blast_tomato/${i}.tomato.m6; 
## False positive reads (B')
blastn -db ~/Data/index/Diamond_BLAST/SP_V2/SP -max_target_seqs 3 -evalue 1e-5 -outfmt 6 -num_threads 56 -query ../../09_unmapped_fa_LA/${i}.unmapped.fa -out ./02_blast_sp/${i}.sp.m6; 
done