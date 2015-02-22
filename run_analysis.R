# Getting and Cleaning Data Course Project

# 1 Merges the training and the test sets to create one data set.

dataTest <- read.table("./data/UCI HAR Dataset/test/X_test.txt")     # import test data
dataTrain <- read.table("./data/UCI HAR Dataset/train/X_train.txt")  # import train data

dataCombine <- rbind(dataTest, dataTrain)  # combines the test and train data (in that order)

dataNames <- read.table("./data/UCI HAR Dataset/features.txt")  # imports variable names
colnames(dataCombine) <- as.character(dataNames[, 2])           # assigns variable names to combined data

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

dataMean <- dataCombine[, grep("mean", names(dataCombine))]  # creates DF of mean measurements
dataSD <- dataCombine[, grep("std", names(dataCombine))]     # creates DF of standard deviation measurements
dataSelect <- cbind(dataMean, dataSD)                        # DF of mean and std measurements

# 3. Uses descriptive activity names to name the activities in the data set

library(dplyr)
labelsTest <- read.table("./data/UCI HAR Dataset/test/y_test.txt")     # import test activity labels
labelsTrain <- read.table("./data/UCI HAR Dataset/train/y_train.txt")  # import train activity labels
labelsCombine <- rbind(labelsTest, labelsTrain)  # combines the test and train activity labels
colnames(labelsCombine) <- "Activity"
labelsNames <- read.table("./data/UCI HAR Dataset/activity_labels.txt")  # import activity names
labelsNames <- rename(labelsNames, Activity = V1, Name = V2)

# replace the activity codes with the activity name
for(i in 1:nrow(labelsNames)){
  labelsCombine$Activity <- gsub(labelsNames[i,1], labelsNames[i, 2], labelsCombine$Activity)
}

dataSelect <- cbind(labelsCombine, dataSelect)  # adds the activity names to the data set

subjectTest <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")     # import test subject identifiers
subjectTrain <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")  # import train subject identifiers
subjectCombine <- rbind(subjectTest, subjectTrain)  # combines the test and train subject identifiers
colnames(subjectCombine) <- "Subject_ID"  # labels the column "Subject_ID"
dataSelect <- cbind(subjectCombine, dataSelect)  # adds the Subject IDs to the data set

# 4. Appropriately labels the data set with descriptive variable names. 

library(rapport)  # load rapport library (formatting functions for reporting)
variableNames <- colnames(dataSelect)              # create a vector of the data variable Names
variableNamesLegal <- make.names(variableNames)    # make the variable names R legal
variableNamesCamel <- tocamel(variableNamesLegal)  # transform the R legal variable names to camelCase
colnames(dataSelect) <- variableNamesCamel         # replace the data variable names with the camelCase names

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of 
#    each variable for each activity and each subject.

library(dplyr)  # dplyr needs to be reloaded after rapport because rapport loads plyr
dataSum <- group_by(dataSelect, Activity, SubjectID)  # create a dataframe grouped by Activity and SubjectID
dataSum <- summarise_each(dataSum, funs(mean))        # report the mean for each variable by Activity and SubjectID

write.table(dataSum, file = "./data/tidyData.txt", row.name = FALSE)  # output summary data
               
