library(plyr)
library(dplyr)

# Load parameter documentation tables
activities      <- read.table("UCI HAR Dataset/activity_labels.txt")
features        <- read.table("UCI HAR Dataset/features.txt")

# Load "training" data set
subject_train   <- read.table("UCI HAR Dataset/train/subject_train.txt")
X_train         <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train         <- read.table("UCI HAR Dataset/train/y_train.txt")

# Load "test" data set
subject_test    <- read.table("UCI HAR Dataset/test/subject_test.txt")
X_test          <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test          <- read.table("UCI HAR Dataset/test/y_test.txt")

# Merge training and test data sets 
#       first, row bind test and training data sets
all_subjects    <- rbind(subject_test, subject_train)
all_activities  <- rbind(y_test, y_train)
all_data        <- rbind(X_test, X_train)

#       second, create final, raw data frame
HARUS_data_raw  <- cbind(all_subjects, all_activities, all_data)

#       third, make column label vector for raw data and apply
HARUS_data_raw_names            <- c("Participant_ID", "Participant_Activity", as.character(features$V2))
names(HARUS_data_raw)           <- HARUS_data_raw_names

# Extract only summary variables in form of means and standard deviations for first Tidy dataset.
toMatch <- c("Participant_ID", "Participant_Activity", "mean", "std")
HARUS_data_meanstd_names        <- unique(grep(paste(toMatch, collapse = "|"), names(HARUS_data_raw), value=T))
HARUS_data_meanstd              <- subset(HARUS_data_raw, select = HARUS_data_meanstd_names)

# Convert raw variable names to descriptive variable names for first Tidy dataset.
names(HARUS_data_meanstd)           <- gsub("\\.", "", names(HARUS_data_meanstd))
names(HARUS_data_meanstd)           <- gsub("\\-", "", names(HARUS_data_meanstd))
names(HARUS_data_meanstd)           <- gsub("\\(\\)", "", names(HARUS_data_meanstd))
names(HARUS_data_meanstd)           <- gsub("BodyBody", "Body", names(HARUS_data_meanstd))
names(HARUS_data_meanstd)           <- gsub("tBody", "Body", names(HARUS_data_meanstd))
names(HARUS_data_meanstd)           <- gsub("fBody", "FFTBody", names(HARUS_data_meanstd))
names(HARUS_data_meanstd)           <- gsub("tGravity", "Gravity", names(HARUS_data_meanstd))
names(HARUS_data_meanstd)           <- gsub("fGravity", "FFTGravity", names(HARUS_data_meanstd))
names(HARUS_data_meanstd)           <- gsub("Acc", "Acceleration", names(HARUS_data_meanstd))
names(HARUS_data_meanstd)           <- gsub("Gyro", "AngularVelocity", names(HARUS_data_meanstd))
names(HARUS_data_meanstd)           <- gsub("Mag", "Magnitude", names(HARUS_data_meanstd))
names(HARUS_data_meanstd)           <- gsub("X", "XAxis", names(HARUS_data_meanstd))
names(HARUS_data_meanstd)           <- gsub("Y", "YAxis", names(HARUS_data_meanstd))
names(HARUS_data_meanstd)           <- gsub("Z", "ZAxis", names(HARUS_data_meanstd))


# Create final Tidy dataset from first Tidy dataset, containing means of all named features.
tdbig           <- HARUS_data_meanstd[, 3:dim(HARUS_data_meanstd)[2]]
HARUS_tidy      <- aggregate(tdbig, list(HARUS_data_meanstd$Participant_ID, HARUS_data_meanstd$Participant_Activity), mean)

# Annotate final Tidy dataset.
names(HARUS_tidy) <- c("Participant_ID", "Participant_Activity", names(HARUS_tidy)[3:81])
HARUS_tidy$Participant_Activity <- mapvalues(HARUS_tidy$Participant_Activity, from=c("1", "2", "3", "4", "5", "6"), to = c("Walking", "WalkingUpStairs", "WalkingDownStairs", "Sitting", "Standing", "Lying"))

# Write Tidy dataset "HARUS_tidy" to file.
write.table(HARUS_tidy, "HARUS_tidy.txt", row.names = FALSE, col.names = TRUE, sep = "\t")