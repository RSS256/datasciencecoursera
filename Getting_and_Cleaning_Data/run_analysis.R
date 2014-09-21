run_analysis <- function() {
        ## PURPOSE OF FUNCTION
        ## The purpose of this function is as follows
        ##  1. combine the data files in the https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
        ##      website into a single tidy data set
        ##  2. limit the contents of the data set to mean and standard deviations of measured parameters.
        ##  3. employ descriptive activity names for the activities in the data set.
        ##  4. employ appropriate and descriptive names for the data parameters.
        ##  5. create a 2nd tidy data set that provides the mean of each data paramater for each combination
        ##      of study activity and study participant.
        
        ## While my R installation defaults to the user/Rob/Documents directory, I established a subdirectory "Cleaning_Data"
        ##   in which to perform this project.  Therefore the following commands change the working directory to "Cleaning_Data"
        ##   and then establish a subdirectory "project" in which to keep the data.
        setwd("./Cleaning_Data")
        if (!file.exists("project")) {dir.create("project")}
        
        ## Establish the website in which the zip file containing the data is located, download the zip file,
        ##   and then extract the contents of the zip file into the "project subdirectory.
        get_url <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(get_url,destfile="./project/data.zip")
        unzip("./project/data.zip",exdir="./project")
        
        ## Download the files containing the column headings for the numerical data, the numerical data from the "test" directory (applying
        ## the column headings) and the numerical data from the "train" directory (applying the column headings).
        data_headings <- read.table("./project/UCI HAR Dataset/features.txt",sep="",strip.white=TRUE)
        data_from_test_folder <- read.table("./project/UCI HAR Dataset/test/X_test.txt",sep="",col.names=data_headings$V2,strip.white=TRUE)
        data_from_train_folder <- read.table("./project/UCI HAR Dataset/train/X_train.txt",sep="",col.names=data_headings$V2,strip.white=TRUE)
        
        ## Combine the numerical data from "test" and "train" directories into a single data frame.
        combined_data <- rbind(data_from_test_folder,data_from_train_folder)
        
        ## By examining the column headings, I identified those columns that seem to contain means and standard deviations
        ##  of the numerical data.  The following command extracts those columns into a new data frame, "mean_and_std_dev_data".
        mean_and_std_dev_data <- combined_data[,c(1,2,3,4,5,6,41,42,43,44,45,46,81,82,83,84,85,86,121,122,123,124,125,126,161,162,163,164,165,166,201,202,214,215,227,228,240,241,253,254,266,267,268,269,270,271,294,295,296,345,346,347,348,349,350,373,374,375,424,425,426,427,428,429,452,453,454,503,504,513,516,517,526,529,530,539,542,543,552,555,556,557,558,559,560,561)]
        
        ## Download the lists of activities (walking, standing, laying, etc.) that correspond to the numerical data in the "test" and "train"
        ##  directories and combine them as a single data frame.  Perform a similar operation for the lists of study partipants (#1, 2, 3, ...30)
        ##  corresponding to the numerical data.  Finally, combine the "activity" and "participant" data frames with the numerical data frame
        ##  to create a new data frame, "full_table".
        activity <- rbind(read.table("./project/UCI HAR Dataset/test/y_test.txt"),read.table("./project/UCI HAR Dataset/train/y_train.txt"))
        participant <- rbind(read.table("./project/UCI HAR Dataset/test/subject_test.txt"),read.table("./project/UCI HAR Dataset/train/subject_train.txt"))
        full_table <- cbind(activity,participant,mean_and_std_dev_data)
        
        ## The original column names were lengthy and difficult to read in the R output.  Therefore, I developed a file containing
        ##  simplified names, downloaded the file into a character vector, and applied the new column names to the "full_table" data frame.
        new_headers <- c(read.table("./project/UCI HAR Dataset/new_headers.txt",stringsAsFactors=FALSE)$V1)  ## use stringsAsFactors argument to prevent output as factor.
        names(full_table) <- new_headers
        
        ## Convert the existing numerical activity indicators (1,2, ..6) with more descriptive verbal descriptions.
        ##  It is possible this could also have been done using the "merge" command, although I was unable to successfully do this.
        full_table$Activity[full_table$Activity == "1"] <- "Walking"
        full_table$Activity[full_table$Activity == "2"] <- "Walking Upstairs"
        full_table$Activity[full_table$Activity == "3"] <- "Walking Downstairs"
        full_table$Activity[full_table$Activity == "4"] <- "Sitting"
        full_table$Activity[full_table$Activity == "5"] <- "Standing"
        full_table$Activity[full_table$Activity == "6"] <- "Laying"
        
        ## Reorder the contents of the "full_table" matrix by the parameters "activity" and "participant", and
        ##  then group the contents by the same parameters (the first of these actions may be redundant).  Use the
        ##  summarise_each command to calculate the mean of each numerical data parameter corresponding to each
        ##  combination of "activity" and "participant".
        full_table_ordered <- full_table[order(activity,participant),]
        full_table_grouped <- full_table_ordered %>% group_by(activity,participant)
        mean_values <- full_table_grouped %>% summarise_each(funs(mean))
        
        ## Write the data frame containing the mean values into a text file, using the
        ##  'sep="\t"' argument to make sure it is formatted as a tab-delimited file. 
        write.table(mean_values,file="mean_values.txt",sep="\t",row.names=FALSE)
}  ## End of "run_analysis" function