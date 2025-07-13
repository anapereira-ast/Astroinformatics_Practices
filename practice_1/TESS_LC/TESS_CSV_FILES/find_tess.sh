# This code searches for all the .csv files in the current folder, saves their names
# in a file named tess_csv.txt and then prints that list to the screen.
tess_names = " tess_csv.txt "
ls *. csv > " $tess_names "
echo " Files found $tess_names : "
cat $tess_names
