################ PREREQUESITES #################

GET THE ZIP's URL

Using the download file method, download the zip file related to the previous URL

Unzip the downloaded zip file

Set the working directory to be in the decompressed zip file

Get the train measures 

Get the test measures 

Get the train measures label ID's 

Get the test measures label ID's

Get all the 06 labels for the label ID's

Get labels for all measurements

Set training dataset column's labels for all measurements

Set test dataset column's labels for all measurements

################ QUESTION 1 #################

Import sqldf library to perform our merge

Merge the 02 Dataframes "traindf" and "testdf"

OUTPUT DATASET ==> RESULTQUEST1

################ QUESTION 2 #################

Calculate Mean and Standard Deviation for each measures

OUTPUT DATASET ==> RESULTQUEST2

################ QUESTION 3 #################

Join descriptive activity to merged dataset

1- Get the descriptive activities for training datas

2- Get the descriptive activities for test datas

3- Merge labelised training and test datas 

OUTPUT DATASET ==> RESULTQUEST3

################ QUESTION 4 #################

Add the labels for each activities

OUTPUT DATASET ==> RESULTQUEST4

################ QUESTION 5 #################

Import data.table library

Import plyr library

Split the QUESTION4 dataframe by activities and calculate the mean for each variable

OUTPUT DATA.TABLE ==> RESULTQUEST5

Write theQUESTION5 dataset to CSV with  row.name option equal to FALSE
