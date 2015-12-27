## Getting & Cleaning Data
## Course Project
## Trey Sinyard

## Step 1: Read data into R
subject_test <- read.table("subject_test.txt", header = FALSE)
subject_train <- read.table("subject_train.txt", header = FALSE)
x_test <- read.table("X_test.txt", header = FALSE)
x_train <- read.table("X_train.txt", header = FALSE)
y_test <- read.table("y_test.txt", header = FALSE)
y_train <- read.table("y_train.txt", header = FALSE)
features <- read.table("features.txt", header = FALSE)

## Step 2: Name the columns
names(subject_test) <- "subjectID"
names(subject_train) <- "subjectID"
names(x_train) <- features$V2
names(x_test) <- features$V2
names(y_train) <- "activity"
names(y_test) <- "activity"

## Step 3: Combine the x & y tests
test <- cbind(subject_test, y_test, x_test)
train <- cbind(subject_train, y_train, x_train)
total <- rbind(train, test)

print(head(total))

## Step 4: Find the measurements with mean & standard deviations
meanstd <- grepl("mean\\(\\)", names(total)) | grepl("std\\(\\)", names(total))
meanstd[1:2] <- TRUE
total <- total[, meanstd]

## Step 5: Add the activity labels
total$activity <- factor(total$activity, label = c("Walking", "Walking Upstairs",
                                                   "Walking Downstairs", "Sitting",
                                                   "Standing", "Laying"))

## Step 6: Appropriately label the variables
names(total) <- gsub("^t", "time", names(total))
names(total) <- gsub("^f", "frequency", names(total))
names(total) <- gsub("Acc", "accelerometer", names(total))
names(total) <- gsub("Gyro", "gyroscope", names(total))
names(total) <- gsub("Mag", "magnitude", names(total))
names(total) <- gsub("BodyBody", "body", names(total))

## Step 7: Merge the data sets
library(reshape2)
merged <- melt(total, id = c("subjectID", "activity"))
final <- dcast(merged, subjectID + activity ~ variable, mean)

## Step 8: Write the final data set
write.csv(final, "tidy.csv", row.names = FALSE)