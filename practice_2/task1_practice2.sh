#!/bin/bash

#Input

tess_file="/Users/anapereira/Documents/tess_practice/tess_csv_lc"

#Output

tess_file_modified="/Users/anapereira/Documents/tess_practice/tess_csv_lc/practice_2"

#for tess_csv in "$tess_file"/*.csv; do
#	new_name=$(basename "$tess_csv" .csv)
#	sed 's/,/ /g' "$tess_csv" > "$tess_file_modified/${new_name}_mod.csv"
#done

#for tess_mod in "$tess_file_modified"/*.csv; do
#	mv "$tess_mod" "${tess_mod%.csv}.lc"
#done

#for tess_mod in "$tess_file_modified"/*.lc; do
#        mv "$tess_mod" "${tess_mod%.csv}.csv" 
#done

#echo "Modified archives are in practive_2 folder"


#for tess_lc in "$tess_file_modified"/*.lc; do 
#    base_name=$(basename "$tess_lc" .lc)
#    new_file="$tess_file_modified/${base_name}_lcfile.lc"
#    awk -F' ' 'NR==1 {print "TIME PDCSAP_FLUX PDCSAP_FLUX_ERR"} NR>1 {print $1 " " $8 " " $9}' "$tess_lc" > "$new_file"
#done

#lc_file="/Users/anapereira/Documents/tess_practice/tess_csv_lc/practice2/lc_columns"

for tess_lc in "$tess_file_modified"/*.lc; do
    mv "$tess_lc" "${tess_lc%.lc}.csv"
done
