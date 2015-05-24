## ---------------------------------------------------------------------------------
# Coursera Code: getdata-014 
# Getting and Cleaning Data
# Course Project:
# Create one R script called run_analysis.R that does the following. 
# 
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each 
#    measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set 
#    with the average of each variable for each activity and each subject.
# 
# Create 17/5/2015 by zafbrb
# Codebook:  avgVarGrouped_Codebook.txt
## ---------------------------------------------------------------------------------


getFile <- function(datasetDir, fileName, colnames) {
## ---------------------------------------------------------------------------------
# getFile: Reads a file from a data directory and returns it as a tbl_df data frame 
# 
# Parameters:  
#       datasetDir: Directory from which will read
#       fileName: filename to be read in
#       colnames: Optional - vector of column names
#
# Result:
# 
# Create 17/5/2015 by zafbrb
## ---------------------------------------------------------------------------------        
        #Check for missing dataset directory
        if(!file.exists(datasetDir)) {
                message("***Error - Directory ", datasetDir, " does not exist")
                break
        }
        #Check for missing file
        if(!file.exists(paste(datasetDir, fileName, sep="/"))) {
                message("***Error - File ", fileName, " does not exist")
                break
        }
        
        #Read the file - if colnames is not passed do not use
        if(missing(colnames)) {
                gFile <- read.table(paste(datasetDir, fileName, sep="/"), 
                                    header=FALSE,
                                    sep="", 
                                    stringsAsFactors=FALSE)
                
        } else {
                gFile <- read.table(paste(datasetDir, fileName, sep="/"), 
                                header=FALSE,
                                sep="", 
                                stringsAsFactors=FALSE,
                                col.names=colnames)
        }
        return(tbl_df(gFile))                        
}



processData <- function(type="test", baseDir, dictionary, debug=FALSE) {
## ---------------------------------------------------------------------------------
# ProcessData: Process the X dataset from Human Activity Recognition using Smartphones
# dataset
# 
# This function will read data from eithier the "test" or "train" subdirectories 
# of the data collection and produce a tidy dataset of selected feature vector 
# identifing the subject and activity ids as well as the source of data
#
# Processing:
# [1] - [6] load required files from train or test sub-directories
# [7] load the actual measurement data file
# [8] prune the columns not required - keep only columns with "std" and "mean" 
#     in the name
# [9] Assemble the file by concatenating columns together - Subject_id + 
#     Activity_id + Activity.Description + measurement data
# [10] Add a data source column at the end of the file to id the source (test or train)  
# 
# Parameters:  
#       type: "train" or "test"
#       baseDir: character string containg the base directory name for the source data
#       dictionary: dictionary object created in calling environment - makeDictionary()
#       debug: TRUE or FALSE - if TRUE will output diagnostic messages to the console
#
# Result: A tidy tbl_df data structure containing training or test data 
# 
# Create 17/5/2015 by zafbrb
## ---------------------------------------------------------------------------------       
#       
        
        #[1]construct right file names - test or train based on type parameter
        workDir <- paste(baseDir, type, sep="/")
        subject_file <- paste("subject_", type, ".txt", sep="")
        activity_file <- "activity_labels.txt"
        features_file <- "features.txt"
        y_file_name <- paste("y_",type, ".txt", sep="")
        X_file_name <- paste("X_", type, ".txt", sep="")
 
        if(debug){cat("[1] Completed file names using ",workDir, 
                "as work directory and", type, "as type", "\n")}
        
        #[2]Load Features file
        gFeatures <- getFile(baseDir, features_file, 
                             c("Variable.Position", "Variable.Label"))
        if(debug) { cat("[2] Loaded Features file...", nrow(gFeatures), "rows", "\n")}
        
        #[3]Load Activity Labels
        gActivityLabels <- getFile(baseDir, 
                                   activity_file,
                                   c("Activity_id", "Activity.Description"))
        if(debug) { cat("[3] Loaded Activity labels file...", nrow(gActivityLabels), "rows", "\n")}
        
        #[4]Now get the Subject data (who performed the activity)   
        gSubject <- getFile(workDir, 
                                subject_file, 
                                c("Subject_ID"))        
        if(debug) { cat("[4] Loaded Subject file...", nrow(gSubject), "rows", "\n")}

        #[5]Need to load the activity file
        y_file <- getFile(workDir, 
                          y_file_name,
                          c("Activity_ID"))
        if(debug) { cat("[5] Loaded y data file (activities)...", nrow(y_file), "rows",  "\n")}

        #[6]SQl to concatenate Class Descriptions
        y_file <- sqldf("select a1.*, b1.[Activity.Description] from y_file a1, 
                        gActivityLabels b1 where a1.Activity_id=b1.Activity_id")
        if(debug) { cat("[6] Concatenated Activity descriptions to the y_file...", "\n")}
        
        #[7]Reads the X data file and renames columns using the features vector
        #Note col.names for read.table will automatically make column names valid
        X_file <- getFile(workDir,
                          X_file_name,
                          gFeatures[[2]])
        
        # Have to fix the names in gFeatures as they are not valid for R - the above  
        # is equivalent to this 
        #       names(X_file) <- make.names(gFeatures[[2]])
        
        #Creating a local data dictionary to keep track of which variables used
        dict <- data.frame(gFeatures[[2]], colnames(X_file), type, stringsAsFactors=FALSE)
        names(dict) <- c("Feature.Varable.Names", "Fixed.Variable.Names", "Type")

        if(debug) { cat("[7] Loaded X data file - Fixed names - Data Dictionary created...", nrow(X_file), "rows", "\n")}
        
        #[8]Select the columns to keep - we end up with a vector of column indices
        keepVector <- sort(c(grep("mean.", colnames(X_file), fixed=TRUE), 
                             grep("std.", colnames(X_file), fixed=TRUE)))
        X_file <- X_file[, keepVector]          # Keep the columns we need     
        
        # Update the global dictionary - we have changed the original column names
        dict <- dict[keepVector,]               # Adjust the dictionary [rows]
        dictionary$appendDict(dict)             # This appends dict to a Global data frame
        if(debug) { cat("[8] Selected mean and std columns - Updated global dictionary...", "\n")}        
        
        #[9]Push it altogether
        X_file <- tbl_df(cbind(gSubject, y_file, X_file))     #Concatenated column wise
        if(debug) { cat("[9] Assembled the file...", "\n")}
        
        #[10]Add a variable to indicate the source (mutate)
        X_file <- mutate(X_file, Data.Source = paste(type, " data set", sep=""))
        if(debug) { cat("[10] Added the source indicator...", "\n")
                    cat("[10] Shape is", nrow(X_file), "rows and", ncol(X_file), "cols", "\n\n")}
        
        return(X_file)
}


makeDictionary <- function() {
## ---------------------------------------------------------------------------------
# makeDictionary: Creates a Dictionary object with methods for getting and appending
#                 dictionary data. 
#                 The dictionary structure is 
#                    Feature.Variable.Names -> Original variable names from features.txt
#                    Fixed.Variable.Names -> Variables name used for this analysis 
#                    Type -> source of the variables names
# 
# Parameters:  None
#
# Result:  Dictionary object
#
# Usage: 
#               x <- makeDictionary() will create a dictionary object x
#               x$getDict() will return the dictionary data
#               x$appendDict(dictionary) will append dictionary to the global dictionary
#               x$setDict(dictionary) will set the Global dictionary to dictionary
# 
# Create 17/5/2015 by zafbrb
## ---------------------------------------------------------------------------------    
##      
        # initialise this environment
        myDictionary <- data.frame(Feature.Varable.Names=character(), 
                                   Fixed.Variable.Names=character(),
                                   Type=character(),
                                   stringsAsFactors=FALSE)
        
        # function to retrieve the dictionary
        getDict <- function() {
                myDictionary
        }
        
        # function to replace the dictionary 
        setDict <- function(dictionary) {
                myDictionary <<- dictionary           
        }
        
        # function to append data to the dictionary
        appendDict <- function(dictionary) {
                myDictionary <<- rbind(myDictionary, dictionary) 
        }
        
        list(getDict = getDict, 
             setDict = setDict, 
             appendDict = appendDict)
}    


## ---------- Start of main script -------------------------------------------------

## ---------------------------------------------------------------------------------
# Set the Environment
# Note library PLYR must be loaded before DPLYR
## ---------------------------------------------------------------------------------
cat("*** Starting Data Prep for getdata-014 Course Project ***", "\n")
library(plyr)
library(dplyr)
library(stringi)
library(stringr)
library(tidyr)
library(sqldf)

skip.load <- FALSE      #if TRUE then we do not reload the data file from the web
## ---------------------------------------------------------------------------------
# Get the zipped data file and unpack it
## ---------------------------------------------------------------------------------
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
myDest <- "getdata_projectfiles_UCI_HAR_Dataset.zip"
dataDir <- "UCI HAR Dataset"
# Windows so do not need method="curl". Downloades to current working dir
if (!skip.load) {
        download.file(fileURL, myDest)
        datedownLoaded <- Sys.Date()
        
        # Unzip the files into the working directory
        unzip(myDest)
        cat("[A] Unpacked date source files into ", dataDir, "\n\n")
        dateLoaded <- Sys.Date()
} else {
        cat("[A] Using existing data directory", dataDir, ". Set skip.load=FALSE to reload\n\n")
}

## ---------------------------------------------------------------------------------
# Create a global dictionary object. This will enable us to append dictionary data 
# from the processData() function 
## ---------------------------------------------------------------------------------
dictionaryObj <- makeDictionary()

## ---------------------------------------------------------------------------------
# Retrieve the TRAIN and TEST datasets
## ---------------------------------------------------------------------------------
test_df <- processData("test", dataDir, dictionaryObj, debug=TRUE)
cat("[B] Created test_df containing test data", "\n")

train_df <- processData("train", dataDir, dictionaryObj, debug=TRUE)
cat("[C] Created train_df containing train data", "\n")

## ---------------------------------------------------------------------------------
# Lets stack the two datasets to form single tidy dataset
## ---------------------------------------------------------------------------------
stacked_df <- rbind(train_df, test_df)
cat("[D] Created merged dataset - stacked_df containing train and test data ", "\n")
cat("[D] complete_df - ", nrow(stacked_df), "rows and", ncol(stacked_df), "cols", "\n\n")

## ---------------------------------------------------------------------------------
# Ok now lets create a new tidy dataset - average of all the variables for each
# activity and subject
# We will only use columns 4 to 69 since the first 4 are indentifiers as is the last
## ---------------------------------------------------------------------------------
avgVarGrouped <- ddply(stacked_df, .(Subject_ID, Activity.Description), 
             colwise(mean, colnames(stacked_df)[4:69]))

# Lets change the variables names to show its the average
nameVector <- colnames(avgVarGrouped)

# Exclude the first 2 columns as they are the keys 
nameVector[3:length(nameVector)] <- paste("AVG-", nameVector[3:length(nameVector)], sep="")

# Do the rename
names(avgVarGrouped) <- nameVector

## ---------------------------------------------------------------------------------
# Finally surface the dictionary data frame and align with our final output dataset 
## ---------------------------------------------------------------------------------
myDictionary <- dictionaryObj$getDict()
myDictionary <- filter(myDictionary, Type=="train")    #Only need one set of rows
myDictionary[,2] <- nameVector[3:length(nameVector)]

## ---------------------------------------------------------------------------------
# Write the final data set out to a file 
## ---------------------------------------------------------------------------------
write.table(avgVarGrouped, "avgVarGrouped.txt", row.name=FALSE)
write.table(myDictionary, "avgVarGrouped_Dict.txt", row.name=FALSE) 

cat("[E] Tidy dataset avgVarGrouped created containing avg of variables by Subject and activity ID", "\n")
cat("[E] avgVarGrouped - ", nrow(avgVarGrouped), "rows and", ncol(avgVarGrouped), "cols", "\n\n")
cat("[F] Written final output to file avgVarGrouped.txt in working directory",  "\n")
cat("[F] Written dictionary output to file avgVarGrouped_Dict.txt in working directory",  "\n\n")
cat("***Data Prep completed ***", "\n")
