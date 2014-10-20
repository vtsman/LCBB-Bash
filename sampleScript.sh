mkdir images
mkdir archives
mkdir documents
mkdir unidentified

for f in *.*
do
	t=$(file -b $f)
	if [[ $t =~ PNG*|TIFF*|JPEG* ]]
	then
		mv $f images/$f
	fi

	if [[ $t =~ Zip*|TAR* ]]
	then
		if [[ $f =~ *.docx|*.doc|*.pptx|*.ppt ]]
		then
			mv $f documents/$f
		else
			mv $f archives/$f
		fi
	fi
	if [[ $t == UTF-8 ]]
	then
		mv $f documents/$f
	fi
done

find ./ -atime +1w -type f -maxdepth 0 -name "*" -exec mv {} unidentified/{} \;