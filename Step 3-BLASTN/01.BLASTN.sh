# unmapped reads with reference genomes for BLASTN

# Create Index
makeblastdb -in Spenn.fasta -dbtype nucl -out SP
makeblastdb -in Sl_4.0.fa -dbtype nucl -out Sl