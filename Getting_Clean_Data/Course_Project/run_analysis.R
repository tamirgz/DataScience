library(dplyr)
library(plyr)

## read the input data files
xTestSet = read.table("./UCI HAR Dataset/test/X_test.txt")
yTest = read.table("./UCI HAR Dataset/test/y_test.txt")
xTrainSet = read.table("./UCI HAR Dataset/train/X_train.txt")
yTrain = read.table("./UCI HAR Dataset/train/y_train.txt")
subjectTest = read.table("./UCI HAR Dataset/test/subject_test.txt")
subjectTrain = read.table("./UCI HAR Dataset/train/subject_train.txt")

## add the activity type column
xTestSet <- mutate(xTestSet,Y = yTest$V1)
xTrainSet <- mutate(xTrainSet,Y = yTrain$V1)
## add the subject ID column
xTestSet <- mutate(xTestSet,Subject = subjectTest$V1)
xTrainSet <- mutate(xTrainSet,Subject = subjectTrain$V1)
## remove the unnecessary variables (for simplicity)
rm("subjectTest"); rm("subjectTrain"); rm("yTest"); rm("yTrain")

## reorganize the columns of the databases
xTestSet <- select(xTestSet,Subject,Y,V1:V561)
xTrainSet <- select(xTrainSet,Subject,Y,V1:V561)
# merge the test and the train databases
mergedData <- rbind(xTestSet,xTrainSet)
## data as requested in Q1 of the project
q1Data <- arrange(mergedData,Subject)
## remove the unnecessary variables for simplicity
rm("mergedData")

## Read the features text file
temp <- scan("./UCI HAR Dataset/features.txt", what=list(NULL, name=character()))
features = temp$name
## select the indexes of the variables that contain the word "mean()"
means <- grep("mean()",features)
## select the indexes of the variables that contain the word "std()"
stds <- grep("std()",features)
## sort the indexes for simplicity
selected <- c(means,stds)
selected <- sort(selected)
## Select the "Subject","Activity" and columns including "mean()" and std()"
q2Data <- q1Data[,c(1,2,selected+2)]
#names(q2Data) <- c("Subject","Activity",features[selected])
colnames(q2Data)[1] <- "Subject"
colnames(q2Data)[2] <- "Activity"
## read the activities text file
#temp <- scan("./UCI HAR Dataset/activity_labels.txt", what=list(NULL, name=character()))
#activities <- temp$name
## substitue the activity index with its name
#q2Data$Activity <- activities[q2Data$Activity]
## remove the unnecessary variables for simplicity
#rm("features"); rm("selected"); rm("temp"); rm("means"); rm("stds"); rm("activities")
rm("features"); rm("selected"); rm("means"); rm("stds");

## Calculate average for each variable, for each activity of each subject
q5Data <- summarise_each(group_by(q2Data,Subject,Activity),funs(mean),3:ncol(q2Data))
## write the tidy table to file
write.table(q5Data,file = "./tidyData.txt")
