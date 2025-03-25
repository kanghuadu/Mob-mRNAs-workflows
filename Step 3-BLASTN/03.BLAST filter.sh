# BLAST filter
# Candidate upwardly reads (A)
# Note: To identify reads that are specific to sequences not present in the Heinz 1706 reference genome, 
#we first extract unmapped reads from Heinz 1706 and perform a BLAST search against the cultivated tomato genome. 
#Reads that exhibit high similarity to the cultivated tomato genome are considered potential background noise and are 
#filtered out in subsequent analyses to enhance the accuracy and reliability of the identified specific reads.

cat ../../../01_Data/01.HZ.list.txt | awk '{print $1}' |while read i; 
do 
perl ../../m8_best_pick.pl 01.Blast_Tomato/${i}.m6 03_Best_best_Tomato/${i}.blast_tomato_best.m6; 
done

## Candidate upwardly reads (A')
cat ../../../01_Data/01.HZ.list.txt  | awk '{print $1}' | while read i; 
do 
perl ../../m8_best_pick.pl 02_Blast_SP/${i}.sp.m6 04_Blast_best_SP_retain/${i}.blast_SP_best.m6; 
done
