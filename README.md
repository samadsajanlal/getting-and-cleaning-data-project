# getting-and-cleaning-data-project
## README.md

## Files contained in this repo
CodeBook.md
README.md
run_analysis.R

## Overview
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

## Execution
It runs from the top level directory containing folder "HCI HAR Dataset" - Note that the working directory must be set on line 14 with an absolute path to the top level directory mentioned. For example, if the path to the mentioned folder is "C:/my_folder/HCI HAR Dataset", then the working dir to be set should be "C:/my_folder/"

The script assumes it has in it's working directory the following files and folders

    HCI HAR Dataset/ activity_labels.txt
    HCI HAR Dataset/ features.txt
    HCI HAR Dataset/ test/
    HCI HAR Dataset/ train/

The output is created in working directory with the name of tidy2.txt