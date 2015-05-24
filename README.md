# GetData015-CourseProject

Coursera Getting and Cleaning Data Course Project repsoitory

Course ID: getdata-014 

##Description
This respository contains the submitted course material required for the course project for the Coursera module _Getting and Cleaning Data_

This course material comprise a R code script **"run_Analysis.R"**, as well as a code book describing the data and the steps taken to create it.

In order to run this analysis you will need **R version 3.1.2  or greater**, as well as access to the **internet**. **Watch out: This script has only been tested and run from RStudio** 

##Instructions
1. Copy the **run_Analysis.R** to your R working directory
2. From R - select "file -> Source R Code..." and choose the **run_analysis.R file**
3. From RStudio select "Open File" -> and choose the **run_analysis.R** file. The file will load into the editor window. Click on Source button and the script will be loaded and run
4. This will run the script - this script will load the data from the internet and run the analysis. The data downloaded will be a ZIP file [59.7 MB in size] which will be unpacked into the working directory
5. Two files will be created by this script into the working directory
	a. _avgVarGrouped.txt_ containing the analysis dataset
	b. __avgVarGrouped_Dict.txt__ containing the mapping between the original dataset variables names and the ones created by the analysis
6. The codebook __"avgVarGrouped_Codebook.txt"__ explains the variables created by the analysis script.


##Functions created
The following functions are created by the run_analysis.r script

###Getfile(datasetDir, fileName, colnames)
This function is a wrapper for read.table(). Its job is to read a file from disk and return it as a data.frame
#####Parameters
       datasetDir: Directory from which will read
       fileName: filename to be read in
       colnames: Optional - vector of column names


###processData(type, baseDir, dictionary, debug)
This function does the bulk of the data manipulation steps. processData() is called twice - once for the **train** set of data and once for the **test** set of data. Its purpose is to create a tidy dataset from eithier train or test data files that can be merged to produce the final tidy dataset

	1. Construct the correct file names for eithier **test** or **train**
	2. Load the the activity(what activity was done), features(analysis variables) and subject(who did the activity) data sets from the correct sub directory containing the test or train data.
	3. Loads the actual measurement data from disk
	4. Retains the analysis columns to keep (all cols that measure Standard Deviation or Mean) and drops all others
	5. Updates the dictionary
	6. Joins the identifier columns (Activity and Subject) to the dataset 
	7. Adds a source data identifier column to the dataset containing eithier "test" or "train"
	8. Returns a tidy dataset  

#####Parameters:
       type: "train" or "test"
       baseDir: character string containg the base directory name for the source data
       dictionary: dictionary object created in calling environment - makeDictionary()
       debug: TRUE or FALSE - if TRUE will output diagnostic messages to the console

###makeDictionary()
The original data variables used in the study do not contain valid variables names for R. We have to make the names valid using the make.names() function. We use the dictionary to record the original variable name and the new valid R name that is used in our processing steps. This dictionary uses the global variable technique to allow the script to accumulate the dictionary data for each call to _processData()_

#####Parameters 
	None
 
    The dictionary structure is 
    * Feature.Variable.Names -> Original variable names from features.txt
    * Fixed.Variable.Names -> Variables name used for this analysis 
    * Type -> source of the variables names

#####Usage: 
    * x <- makeDictionary() will create a dictionary object x
    * x$getDict() will return the dictionary data
    * x$appendDict(dictionary) will append dictionary to the global dictionary
    * x$setDict(dictionary) will set the Global dictionary to dictionary


##Script Processing steps
The script starts after the comment line ##-----Start of main script ------

1. Loads all required library's
  - library(plyr)
  - library(dplyr)
  - library(stringi)
  - library(stringr)
  - library(tidyr)
  - library(sqldf)
2. Creates a global dictionary object that will be used to record the original variables names and the changed variable names
3. Sets the variable 'skip.load' to FALSE. This ensures the original data will be loaded from the internet as a ZIP file and then unpacked into the directory **"UCI HAR Dataset"**. If you set this to TRUE the script will not attempt to load the ZIP file from the internet. This is a large file (57.9 MB) and takes a while to load
4. Calls processData() to process eithier train or test data files. The return is a tidy dataset of all the keep variables (std and mean) along with an Activity_ID and Subject_ID.  
5. Stacks the train and test data together (appends the files together)
6. Creates a new dataset that is a mean of each of the columns by Activity and Subject. 
7. Changes the name of the columns to prefix "AVG-" to the names
8. Updates the dictionary
9. Writes out the tidy dataset "avgVarGrouped.txt" to disk
10. Writes out the dataset "avgVarGrouped_Dict.txt" to disk

The script will write progress messages to the console

'> source('G:/Learning/Big Data Samples/getdata-014/run_analysis.R')
*** Starting Data Prep for getdata-014 Course Project *** 
trying URL 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
Content type 'application/zip' length 62556944 bytes (59.7 Mb)
opened URL
downloaded 59.7 Mb'

'[A] Unpacked date source files into  UCI HAR Dataset'
'[1] Completed file names using  UCI HAR Dataset/test as work directory and test as type'
'[2] Loaded Features file... 561 rows'
'[3] Loaded Activity labels file... 6 rows'
'[4] Loaded Subject file... 2947 rows'
'[5] Loaded y data file (activities)... 2947 rows'
'[6] Concatenated Activity descriptions to the y_file...'
'[7] Loaded X data file - Fixed names - Data Dictionary created... 2947 rows'
'[8] Selected mean and std columns - Updated global dictionary...'
'[9] Assembled the file...'
'[10] Added the source indicator...'
'[10] Shape is 2947 rows and 70 cols'

[B] Created test_df containing test data 
[1] Completed file names using  UCI HAR Dataset/train as work directory and train as type 
[2] Loaded Features file... 561 rows 
[3] Loaded Activity labels file... 6 rows 
[4] Loaded Subject file... 7352 rows 
[5] Loaded y data file (activities)... 7352 rows 
[6] Concatenated Activity descriptions to the y_file... 
[7] Loaded X data file - Fixed names - Data Dictionary created... 7352 rows 
[8] Selected mean and std columns - Updated global dictionary... 
[9] Assembled the file... 
[10] Added the source indicator... 
[10] Shape is 7352 rows and 70 cols 

[C] Created train_df containing train data 
[D] Created merged dataset - stacked_df containing train and test data  
[D] complete_df -  10299 rows and 70 cols 

[E] Tidy dataset avgVarGrouped created containing avg of variables by Subject and activity ID 
[E] avgVarGrouped -  180 rows and 68 cols 

[F] Written final output to file avgVarGrouped.txt in working directory 
[F] Written dictionary output to file avgVarGrouped_Dict.txt in working directory 

***Data Prep completed *** 
  '

##Running the script manually

* Make sure the variable skip.load is set to FALSE if you wish NOT to relaod the ZIP file
* Follow the steps in the main script file


