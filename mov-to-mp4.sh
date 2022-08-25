#!/bin/bash

echo "Collecting details to convert .mov to .mp4"

echo "Enter source directory in which the videos are?"

read sourceDirectory

find $HOME$sourceDirectory -type f -name '*.mov' -print0 | while read -d $'\0' file;
do
	echo "Converting .mov files to .mp4"
	filename="$(basename -- $file)"
	ffmpeg -nostdin -i "$file" -c copy -map 0 "${filename%.*}_mp4.mp4";
done
