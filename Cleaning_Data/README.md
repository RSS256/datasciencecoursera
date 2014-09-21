# BACKGROUND ON *RUN_ANALYSIS* FUNCTION

##PURPOSE OF FUNCTION
The purpose of this function is as follows
  1. combine the data files in the https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip website into a single tidy data set.
  2. limit the contents of the data set to mean and standard deviations of measured parameters.
  3. employ descriptive activity names for the activities in the data set.
  4. employ appropriate and descriptive names for the data parameters.
  5. create a 2nd tidy data set that provides the mean of each data paramater for each combination of study activity and study participant.

##PREPARATION FOR FUNCTION DEVELOPMENT
While my R installation defaults to the user/Rob/Documents directory, I established a subdirectory "Cleaning_Data" in which to perform this project.  Therefore the following commands change the working directory to "Cleaning_Data" and then establish a subdirectory "project" in which to keep the data.

Using the *download.file* and *unzip* commands, I downloaded the zip file containing the needed data into my working directory and extracted the needed data files.  These included:
  1. *activity_labels.txt*, listing the six activities performed by test participants.  These are designated by the numbers 1 through 6 with corresponding verbal descriptions, including:
      - #1: Walking
	  - #2: Walking Upstairs
	  - #3: Walking Downstairs
	  - #4: Sitting
	  - #5: Standing
	  - #6: Laying
  2. *features.txt*, listing the categories of numerical data compiled for each of the activities listed in *activity_labels.txt*.
  3. *features_info.txt", explaining the ways in which the various categories of numerical data were obtained, compiled and derived.
  4. *README.txt", providing general background on how the tests were carried out.
  5. *x_test.txt* and *x_train.txt*, containing numerical test data.  This data is recorded in scientific notation, which R is capable of interpreting when the data is read using the *read.table* function.
  6. *y-test.txt* and *y_train.txt*, containing the activity numbers (see *activity_labels.txt*) corresponding to the rows of data in the *x_test.txt* and *x_train.txt* files.
  7. *subject_test.txt* and *subject_train.txt*, containing the numbers (1 through 30) designated for the study participants corresponding to the rows of data in the *x_test.txt* and *x_train.txt* files.

In order to determine the relationships between the files, I used the *dim* function to determine the relative dimensions of the files and therefore how to appropriately apply the *rbind* and *cbind* functions to combine the data files.  I also referred to the *README.txt" file.

##LOADING AND COMBINING DATA FILES IN R
The column headings for the numerical data (features.txt) and the numerical data in the *x_test.txt* and *x_train.txt* files was loaded into R using the *read.table* function, with the "strip.white" argument set equal to "TRUE" to strip unneeded blanks from the individual data values.  The column headings from *features.txt" were applied to the numerical data frames through this operation.

After loading the numerical data from *x_test.txt* and *x_train.txt*, their respective data frames were combined using the *rbind* command.

By examining the column headings in *features.text* in Excel, I identified those columns that seem to contain means and standard deviations, based upon the presence of "mean" and "std" text strings in the names.  Using this information, I assigned the desired column numbers to a numeric vector and used this to extract the columns of interest from the combined data frame established in the previous step.

Using *read.table*, I then downloaded the lists of activities (walking, standing, laying, etc.) that correspond to the numerical data in the combined data frame (with the unwanted columns eliminated) and, using the *cbind* command, combined the activities with the numerical data in a single data frame.  I then performed a similar operation for the lists of study partipants (#1, 2, 3, ...30) to similarly combine this with the numerical data.

##ASSIGNING MEANINGFUL NAMES
The original column names provided in the *features.txt* file were lengthy and became truncated in the output of the *run_analysis" function, making them difficult to read.  Therefore, I developed a set of simplified names, as described in detail in the *CodeBook.md* file.
I saved these revised names in a text file (new_headers.txt), which I read into R using the *read.table* function and assigned to a character vector.  This entailed using a "stringsAsFactors=FALSE" argument for the *read.table* function, since failing to do this prevented the successful creation of the character vector.
I then assigned the values in the character vector to the column headers of the data frame.

As a further measure to provide more meaningful names, I then converted the existing numerical activity indicators (1,2, ..6) in the data frame with the verbal descriptions from *activity_labels.txt*.

##CALCULATION OF MEAN VALUES BY ACTIVITY TYPE AND STUDY PARTICIPANT
Using the *order* function, I reordered the contents of the data frame by the parameters "activity" and "participant".  I then grouped the contents of the data frame using the same parameters via the *group_by* function.
The *summarise_each* function then allowed me to calculated the means for the grouped parameters.

Finally, I wrote the data frame containing the mean values into a text file via the *write.table* command, using the 'sep="\t"' argument to ensure formatting as a tab-delimited file. 