################# PREREQUESITES #################
#GET THE ZIP's URL
zipurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#Using the download file method, download the zip file related to the previous URL
download.file(zipurl,"CLEANDATAPROJECT.zip",mode="wb")
#Unzip the downloaded zip file
unzip("CLEANDATAPROJECT.zip")
#Set the working directory to be in the decompressed zip file
setwd(paste0(getwd(),"/UCI HAR Dataset"))


#Get the train measures 
traindf <- read.csv("train/X_train.txt", sep="", header=FALSE)
#Get the test measures 
testdf <- read.csv("test/X_test.txt", sep="", header=FALSE)
#Get the train measures label ID's 
trainlab <- read.csv("train/Y_train.txt", header=FALSE)
#Get the test measures label ID's
testlab <- read.csv("test/Y_test.txt", header=FALSE)
#Get all the 06 labels for the label ID's
alllabels <- read.csv("activity_labels.txt", sep="", header=FALSE)


################# QUESTION 1 #################
#Import sqldf library to perform our merge
library(sqldf)
#Merge the 02 Dataframes "traindf" and "testdf"
DFMERGED <- sqldf('select * from traindf union select * from testdf')
#OUTPUT DATASET ==> RESULTQUEST1
RESULTQUEST1 <- DFMERGED


################# QUESTION 2 #################
#Calculate Mean and Standard Deviation for each measures
DTS <- sapply(DFMERGED, function(x) c( "Stdev" = sd(x), "Mean"= mean(x,na.rm=TRUE)))
#OUTPUT DATASET ==> RESULTQUEST2
RESULTQUEST2 <- DTS


################# QUESTION 3 #################
#Join descriptive activity to merged dataset
#1- Get the descriptive activities for training datas
traindflab <- traindf
traindflab$LABEL_ID <- trainlab$V1
#2- Get the descriptive activities for test datas
testdflab <- testdf
testdflab$LABEL_ID <- testlab$V1
#3- Merge labelised training and test datas 
DFLABMERGED <- sqldf('select * from traindflab union select * from testdflab')
#OUTPUT DATASET ==> RESULTQUEST3
RESULTQUEST3 <- DFLABMERGED


################# QUESTION 4 #################
#Add the labels for each activities
DFLABMERGED2 <- sqldf('select T.*, U.V2 as LABELS from DFLABMERGED T left outer join alllabels U on U.V1=T.LABEL_ID')
#OUTPUT DATASET ==> RESULTQUEST4
RESULTQUEST4 <- DFLABMERGED2


################# QUESTION 5 #################
#Import data.table library
library(data.table)
#Import plyr library
library(plyr)
DT <- data.table(DFLABMERGED2)
#Split the QUESTION4 dataframe by activities and calculate the mean for each variable
#OUTPUT DATA.TABLE ==> RESULTQUEST5
RESULTQUEST5 <- aggregate(DT[, 1:561], list(DT$LABEL_ID, DT$LABELS), mean)

#Write theQUESTION5 dataset to CSV with  row.name option equal to FALSE
write.table(RESULTQUEST5, file="TIDYDATASETQUEST5.txt", row.name=FALSE)
