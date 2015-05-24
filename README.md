# GetData015-CourseProject
Coursera Getting and Cleaning Data Course Project repsoitory
Course ID: getdata-014 

##Description
This respository contains the submitted course material required for the course project for the Coursera module _Getting and Cleaning Data_

This course material comprise a R code script **"run_Analysis.R"**, as well as a code book describing the data and the steps taken to create it.

In order to run this analysis you will need **R version 3.1.2  or greater**, as well as access to the **internet**

##Instructions
1. Copy the **run_Analysis.R** to your R working directory
2. From R - select "file -> Source R Code..." and choose the **run_analysis.R file**
3. From RStudio select "Open File" -> and choose the **run_analysis.R** file. The file will load into the editor window. Click on Source button and the script will be loaded and run 
3. This will run the script - this script will load the data from the internet and run the analysis. The data downloaded will be a ZIP file [59.7 MB in size] which will be unpacked into the working directory
4. Two files will be created
	a. _avgVarGrouped.txt_ containing the analysis dataset
	b. _avgVarGrouped_Dict.txt_ containing the mapping between the original dataset variables names and the ones created by the analysis
5. The codebook __"avgVarGrouped_Codebook.txt"__ explains the variables created by the analysis script.


##Functions created
The following functions are created by the run_analysis.r script


###Getfile(datasetDir, fileName, colnames)
This function is a wrapper for read.table(). Its job is to read a file from disk and return it as a data.frame
	**Parameters**
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

	**Parameters**
       type: "train" or "test"
       baseDir: character string containg the base directory name for the source data
       dictionary: dictionary object created in calling environment - makeDictionary()
       debug: TRUE or FALSE - if TRUE will output diagnostic messages to the console


###makeDictionary()
The original data variables used in the study do not contain valid variables names for R. We have to make the names valid using the make.names() function. We use the dictionary to record the original variable name and the new valid R name that is used in our processing steps. This dictionary uses the global variable technique to allow the script to accumulate the dictionary data for each call to _processData()_ 

	**Parameters:** 
	None
    
    The dictionary structure is 
    	+ Feature.Variable.Names -> Original variable names from features.txt
    	+ Fixed.Variable.Names -> Variables name used for this analysis 
    	+ Type -> source of the variables names

	**Usage:** 
        + x <- makeDictionary() will create a dictionary object x
        + x$getDict() will return the dictionary data
        + x$appendDict(dictionary) will append dictionary to the global dictionary
        + x$setDict(dictionary) will set the Global dictionary to dictionary


##Script Processing steps


##Running the script manually


