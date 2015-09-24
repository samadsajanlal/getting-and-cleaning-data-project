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

## CodeBook

Details regarding the variables used from the data set & their measurement units can be found in the CodeBook.md file contained in this repository.

## What the code does

## Transformation

In order to obtain a tidy data set, the following was performed:

1) Read in the features 

2) Read in the activity labels

3) Read in the three training data files

	- These were merged together and the columns were labeled. 
	
	- The first column is activityId. 
	
	- The second column is subjectId
	
	- The remaining columns were labeled using features.txt's second column. Each column received its matching row's field from the 2nd column. So column 4 of x_train.txt received row 4 column 2 value of features.txt, column 8 received row 8 column 2 value, and so on
	
4) The same transformation was performed on the test data

5) The two data sets were merged to make one large data set

6) A logical vector was created to return TRUE for columns that had "mean" (but not meanFreq) and "std" (but not std()) values

7) The merged data set was then filtered against this logical vector in order to return only the values I am interested in

8) The activity labels were merged onto the data set from 7 by matching the activityId's

9) The column headers were cleaned up to make it a bit easier to understand what each variable is

10) To obtain the tidy data set, I removed the activity label and used the aggregate() function to collect the stats required for the project

11) The activity labels are then merged onto the tidy data set

12) The data set is written to a file called tidy2.txt

Note that this information is also present in CodeBook.md