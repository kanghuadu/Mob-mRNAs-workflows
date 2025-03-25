## set the path
rawdata=~/01_Data
cleandata=~/01_clean_fq
fastQC=~/01_fastQC

cat ../01_Data/01.list.txt | awk '{print $1}' | while read i;
do
        fastp -i ${rawdata}/${i}.clean.1.fq.gz -o ${cleandata}/${i}_1.clean.fq.gz -I ${rawdata}/${i}.clean.2.fq.gz -O ${cleandata}/${i}_2.clean.fq.gz \
        -q 20 -z 4 -w 20 -h ${cleandata}/html/${i}.html
        # fastqc evaluates reads quality
        fastqc -q -t 30 -o ${fastQC} ${cleandata}${i}_*.clean.fq.gz 
 
done