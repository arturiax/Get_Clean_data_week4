
#Load libraries
library(dplyr)

# We dowload and unzip the datasets from internet
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "data.zip")
unzip("data.zip")

# We read the 8 tables we need to create the final dataset
xtest <- read.table("./UCI HAR Dataset/test/X_test.txt") #signals in the test set
ytest <- read.table("./UCI HAR Dataset/test/y_test.txt") # type of activity test set
xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt") # signals in the train set
ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt") # type of activity train set
features <- read.table("./UCI HAR Dataset/features.txt") # names of the variables
labels <- read.table("./UCI HAR Dataset/activity_labels.txt") # names of the activities
subtrain <- read.table("./UCI HAR Dataset/train/subject_train.txt") # subjects for the train records
subtest <- read.table("./UCI HAR Dataset/test/subject_test.txt") #subject for the test records

#The names of the features are not in a valid R form, we chage that
valid_names <- make.names(features[,2], unique=TRUE)

#We give names to the features on the train and test sets
colnames(xtest) <- valid_names
colnames(xtrain) <- valid_names

# We replace activty numbers with descriptive names
ytest$activity<-labels$V2[ytest$V1]
ytrain$activity<-labels$V2[ytrain$V1]

# We join the signal values in the xtest set with the corresponding activity (ytest) and
# subject (subtest) values. We add a variable "set_type" to indicate this values are from the
#test set

test <-
  xtest %>%  
  mutate(set_type = "test", subject = subtest$V1 , activity = ytest$activity) %>% 
  select(set_type, subject, activity, 1:561)

# We do the same for the train sets
train <-
  xtrain %>%  
  mutate(set_type = "train", subject = subtrain$V1 , activity = ytrain$activity) %>% 
  select(set_type, subject, activity, 1:561)

#We merge the complete test and train sets
final <- union(test, train)


#We create a function to rename the features so the names are self-explanatory
betternames <- function(name) {
  
  type_of_signal <- ifelse(grepl("Body", name), "Body", "Gravity")
  type_of_tool <- ifelse(grepl("Acc", name), "_acc", "_gyro")
  jerk <- ifelse(grepl("Jerk", name), "_jerk", "_nojerk")
  magnitude <- ifelse(grepl("X", name), "_X", ifelse(grepl("Y", name), "_Y", ifelse(grepl("Z", name), "_Z", "_mag")))
  time_or_fourier <- ifelse(grepl("^t", name), "_t", "_f")
  stat <- ifelse(grepl("mean", name), "_mean", "_std")
  paste0(type_of_signal, type_of_tool, jerk, magnitude, time_or_fourier, stat)
}

#We create the final tydydata set averaging by subject and activity the features that are
# means or standar deviations of the signals

tidydata <- final %>% 
  select(1:3, matches("\\.(mean|std)\\.")) %>% 
  group_by(set_type, subject, activity) %>% 
  summarise_all(mean)

colnames(tidydata)[4:69]<- betternames(colnames(tidydata)[4:69])

write.table(tidydata, "final.txt", row.names = FALSE)

##read.table("final.txt", header= T)


