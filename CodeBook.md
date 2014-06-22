#Human Activity Recognition Using Smartphones Dataset

This dataset was created to test the ability to recognize and predict activity based on smartphone sensor data.

### Dataset Information
Experimental data was collected from a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments were video-recorded and activities were labelled manually. The obtained dataset was randomly partitioned into two sets, where 70% of the volunteers were selected for generating the training data and 30% the test data.

#### Dataset Files

|Filename                |Description |
|------------------------|------------|
|README.txt              |contains an overview of the experiment and a description of the files contained in the dataset.|
|features_info.txt       |contains a description of raw data pre-processing used to produce the train and test datasets.|
|activity_labels.txt     |6 x 2 array |
|                        |Column 1 - integer activity code|
|                        |Column 2 - text activity label|
|features.txt            |561 x 2 array|
|                        |Column 1 - integer column position|
|                        |Column 2 - text column heading|
|train/X_train.txt       |7352 x 561 array of numbers between -1 and 1|
|train/y_train.txt       |7352 x 1 integer list of activity codes corresponding to the records in x_train.txt|
|train/subject_train.txt |7352 x 1 integer list of subject numbers corresponding to the records in x_train.txt|
|*train/Inertial Signals/*|files in this directory were not used|
|test/X_test.txt         |2947 x 561 array of numbers between -1 and 1|
|test/y_test.txt         |2947 x 1 integer list of activity codes corresponding to the records in x_test.txt|
|test/subject_test.txt   |2947 x 1 integer list of subject numbers corresponding to the records in x_test.txt|
|*test/Inertial Signals/* |files in this directory were not used|

### Data transformations
1. x_train.txt and x_test.txt were merged into a single 10299 x 561 dataset.
2. Data for column names containing mean() or std() were extracted into a 10299 x 66 data subset.
3. column names were modified to remove problematic characters, specifically "-" was changed to "_" and "()" was removed.
4. Activity and Subject data were added to the data subset.
5. The activity code was mapped to an activity label providing descriptive names.
6. Each feature column of the data subset was averaged by activity and subject resulting in a 180 x 68 dataset (30 subjects x 6 activities = 180).
7. The default column headings were altered for clarity. "Group.1" and "Group.2" were changed to "Activity" and "Subject" respectively. The feature column names were prepended with "avg_" to indicate that they contain an average of the original feature data.

##### Aggregate tidy data output:
Column | Description
--------|----------
1       |Activity
2	|Subject
3	|avg_tBodyAcc_mean_X
4	|avg_tBodyAcc_mean_Y
5	|avg_tBodyAcc_mean_Z
6	|avg_tBodyAcc_std_X
7	|avg_tBodyAcc_std_Y
8	|avg_tBodyAcc_std_Z
9	|avg_tGravityAcc_mean_X
10	|avg_tGravityAcc_mean_Y
11	|avg_tGravityAcc_mean_Z
12	|avg_tGravityAcc_std_X
13	|avg_tGravityAcc_std_Y
14	|avg_tGravityAcc_std_Z
15	|avg_tBodyAccJerk_mean_X
16	|avg_tBodyAccJerk_mean_Y
17	|avg_tBodyAccJerk_mean_Z
18	|avg_tBodyAccJerk_std_X
19	|avg_tBodyAccJerk_std_Y
20	|avg_tBodyAccJerk_std_Z
21	|avg_tBodyGyro_mean_X
22	|avg_tBodyGyro_mean_Y
23	|avg_tBodyGyro_mean_Z
24	|avg_tBodyGyro_std_X
25	|avg_tBodyGyro_std_Y
26	|avg_tBodyGyro_std_Z
27	|avg_tBodyGyroJerk_mean_X
28	|avg_tBodyGyroJerk_mean_Y
29	|avg_tBodyGyroJerk_mean_Z
30	|avg_tBodyGyroJerk_std_X
31	|avg_tBodyGyroJerk_std_Y
32	|avg_tBodyGyroJerk_std_Z
33	|avg_tBodyAccMag_mean
34	|avg_tBodyAccMag_std
35	|avg_tGravityAccMag_mean
36	|avg_tGravityAccMag_std
37	|avg_tBodyAccJerkMag_mean
38	|avg_tBodyAccJerkMag_std
39	|avg_tBodyGyroMag_mean
40	|avg_tBodyGyroMag_std
41	|avg_tBodyGyroJerkMag_mean
42	|avg_tBodyGyroJerkMag_std
43	|avg_fBodyAcc_mean_X
44	|avg_fBodyAcc_mean_Y
45	|avg_fBodyAcc_mean_Z
46	|avg_fBodyAcc_std_X
47	|avg_fBodyAcc_std_Y
48	|avg_fBodyAcc_std_Z
49	|avg_fBodyAccJerk_mean_X
50	|avg_fBodyAccJerk_mean_Y
51	|avg_fBodyAccJerk_mean_Z
52	|avg_fBodyAccJerk_std_X
53	|avg_fBodyAccJerk_std_Y
54	|avg_fBodyAccJerk_std_Z
55	|avg_fBodyGyro_mean_X
56	|avg_fBodyGyro_mean_Y
57	|avg_fBodyGyro_mean_Z
58	|avg_fBodyGyro_std_X
59	|avg_fBodyGyro_std_Y
60	|avg_fBodyGyro_std_Z
61	|avg_fBodyAccMag_mean
62	|avg_fBodyAccMag_std
63	|avg_fBodyBodyAccJerkMag_mean
64	|avg_fBodyBodyAccJerkMag_std
65	|avg_fBodyBodyGyroMag_mean
66	|avg_fBodyBodyGyroMag_std
67	|avg_fBodyBodyGyroJerkMag_mean
68	|avg_fBodyBodyGyroJerkMag_std

