## You should create one R script called run_analysis.R that does the following. 
## 1- Merges the training and the test sets to create one data set.
## 2- Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3- Uses descriptive activity names to name the activities in the data set
## 4- Appropriately labels the data set with descriptive activity names. 
## 5 - Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

## 1 WALKING
## 2 WALKING_UPSTAIRS
## 3 WALKING_DOWNSTAIRS
## 4 SITTING
## 5 STANDING
## 6 LAYING

pkgTest <- function(x)
{
    if (!require(x,character.only = TRUE))
    {
        install.packages(x,dep=TRUE)
        if(!require(x,character.only = TRUE)) stop("Package not found")
    }
}

Setup <- function(){
    library(reshape2)
    library(plyr)
    #pkgTest("reshape")
    #pkgTest("plyr")
    setwd("/Users/daghan/Hacking/Coursera/Data\ Science/Get\ Data/project")
    a <- read.table("./UCI\ HAR\ Dataset/features.txt")
    features <- as.character(a$V2)
    activitylabels <-  read.table("./UCI\ HAR\ Dataset/activity_labels.txt")
    xtest <-  read.table("./UCI\ HAR\ Dataset/test/X_test.txt")
    ytest <-  read.table("./UCI\ HAR\ Dataset/test/y_test.txt")
    activitytest <- ytest
    for (i in 1:6)  {activitytest[activitytest==activitylabels[i,1]] <- as.character(activitylabels[i,2])}
    stest <- read.table("./UCI\ HAR\ Dataset/test/subject_test.txt")
    xtrain <- read.table("./UCI\ HAR\ Dataset/train/X_train.txt")
    ytrain <-  read.table("./UCI\ HAR\ Dataset/train/y_train.txt")
    activitytrain <- ytrain
    for (i in 1:6)  {activitytrain[activitytrain==activitylabels[i,1]] <- as.character(activitylabels[i,2])}
    strain <- read.table("./UCI\ HAR\ Dataset/train/subject_train.txt")
    mergedtable<- rbind(cbind(xtest,activitytest,stest),cbind(xtrain,activitytrain,strain))
    colnames(mergedtable) <- features
    tidytable <- cbind(mergedtable[1],mergedtable[2],mergedtable[3],
                       mergedtable[4],mergedtable[5],mergedtable[6],
                       mergedtable[41],mergedtable[42],mergedtable[43],
                       mergedtable[44],mergedtable[45],mergedtable[46], 
                       mergedtable[121],mergedtable[122],mergedtable[123],
                       mergedtable[124],mergedtable[125],mergedtable[126],
                       mergedtable[562],mergedtable[563])
    tidycolumnnames <- c("averagemeanbodyaccelerationintimeoverxaxis","averagemeanbodyaccelerationintimeoveryaxis","averagemeanbodyaccelerationintimeoverzaxis",
                     "averagestanddarddeviationbodyaccelerationintimeoverxaxis","averagestanddarddeviationbodyaccelerationintimeoveryaxis","averagestanddarddeviationbodyaccelerationintimeoverzaxis",
                     "averagemeangravityaccelerationintimeoverxaxis","averagemeangravityaccelerationintimeoveryaxis","averagemeangravityaccelerationintimeoverzaxis",
                     "averagestandarddeviationgravityaccelerationintimeoverxaxis","averagestandarddeviationgravityaccelerationintimeoveryaxis","averagestandarddeviationgravityaccelerationintimeoverzaxis",
                     "averagemeanangularvelocityintimeoverxaxis","averagemeanangularvelocityintimeoveryaxis","averagemeanangularvelocityintimeoverzaxis",
                     "averagestandarddeviationangularvelocityintimeoverxaxis","averagestandarddeviationangularvelocityintimeoveryaxis","averagestandarddeviationangularvelocityintimeoverzaxis",
                     "activities", "subject")
    colnames(tidytable) <- tidycolumnnames
    tidytable <- arrange(tidytable, tidytable$subject)
    tinymelt <- melt(tidytable, id=c("subject", "activities"), measure.vars = head(tidycolumnnames,18))
    results <- dcast(tinymelt, subject + activities ~ variable, fun.aggregate=mean)
    write.table(x=results, file = "./tidydata.txt", row.names = F, quote= F, sep= " ")
}

# FindMeanFeatures <- function() {
#     means <- matrix(ncol=2)
#     for (i in 1:length(features)){
#         if (grepl(pattern = ".*mean.*",features[i])) {
#             ## print(paste("Column:", i , " has:" , features[i]))
#             if (is.na(means)[1,1]) 
#                 means[1,] <- c(i,features[i])
#             else 
#                 means <- rbiFrnd(means,c(i,features[i]))
#         }
#     }
#     cbind(means,FALSE)
# }
# 
# FindStdFeatures <- function() {
#     stds <- matrix(ncol=2)
#     for (i in 1:length(features)){
#         if (grepl(pattern = ".*std.*",features[i])) {
#             print(paste("Column:", i , " has:" , features[i]))  
#             if (is.na(stds)[1,1]) 
#                 stds[1,] <- c(i,features[i])
#             else 
#                 stds <- rbind(stds,c(i,features[i]))
#         }
#     }
#     cbind(stds, FALSE)
# }






