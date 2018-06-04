#!/bin/bash
#
# Script Name: makediff.sh
#
# Author: Max Heikenfeld (max.heikenfeld@physics.ox.ac.uk)
# Date : 2018-06-04
#
# Description: A bash script to create a difference pdf from a tex file in a git repository and a tag in that repository

#1st imput: tex file
texfile=$1
#2nd imput: git tag in repository
tag=$2
# get filename of texfile
texfile_name=$(basename "$texfile" ".tex")

# run latexdiff based on the texfile and the git tag and create pdf output:
latexdiff-vc --git --pdf --force -r $tag $texfile

# create directory diff$tag and move the output to that directory:
diff_dir="diff"$tag
mkdir -p $diff_dir
files=$texfile_name"-diff"$tag".*"
echo $files
mv $files $diff_dir
