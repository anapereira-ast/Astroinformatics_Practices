for file in tess_lc_*_mod.csv; do
	newname="${file/_mod}"
	mv "$file" "$newname"
done
