
library(readr)
library(tidyr)
library(dplyr)

# We dowload the dataset from internet
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "data.zip")
unzip("data.zip")


xtest <- read.table("./UCI HAR Dataset/test/X_test.txt")
ytest <- read.table("./UCI HAR Dataset/test/y_test.txt")
ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt")
xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
features <- read.table("./UCI HAR Dataset/features.txt")
labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
subtrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
table(subtrain)
subtest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
table(subtest)

valid_names <- make.names(features[,2], unique=TRUE)
colnames(xtest) <- valid_names
colnames(xtrain) <- valid_names

ytest$activity<-labels$V2[ytest$V1]
ytrain$activity<-labels$V2[ytrain$V1]


test <-
  xtest %>%  
  mutate(set_type = "test", subject = subtest$V1 , activity = ytest$activity) %>% 
  select(set_type, subject, activity, 1:561)

train <-
  xtrain %>%  
  mutate(set_type = "train", subject = subtrain$V1 , activity = ytrain$activity) %>% 
  select(set_type, subject, activity, 1:561)

final <- union(test, train)

betternames <- function(name) {
  
  type_of_signal <- ifelse(grepl("Body", name), "Body", "Gravity")
  type_of_tool <- ifelse(grepl("Acc", name), "_acc", "_gyro")
  jerk <- ifelse(grepl("Jerk", name), "_jerk", "_nojerk")
  magnitude <- ifelse(grepl("X", name), "_X", ifelse(grepl("Y", name), "_Y", ifelse(grepl("Z", name), "_Z", "_mag")))
  time_or_fourier <- ifelse(grepl("^t", name), "_t", "_f")
  stat <- ifelse(grepl("mean", name), "_mean", "_std")
  paste0(type_of_signal, type_of_tool, jerk, magnitude, time_or_fourier, stat)
}

tidydata <- final %>% 
  select(1:3, matches("\\.(mean|std)\\.")) %>% 
  group_by(set_type, subject, activity) %>% 
  summarise_all(mean)

colnames(tidydata)[4:69]<- betternames(colnames(tidydata)[4:69])

write.table

