;# Input Variables

data_train = training main data;
activity_train = training activity tag;
subject_train= training subject tag;
data_test = testing main data;
activity_test = testing activity tag;
subject_test = testing subject tag;
features = list of the variable names of the main data;
activities = list of activity names

# Calculate Variables

data = merged main data set;
activity = merged activity tag;
subject = merged subject tag;
mean_std = vector containing features with "mean" and "std" only;
data_averages = data set with averages by activity and subject
