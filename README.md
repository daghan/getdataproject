# Coursera Signature Track Getting and Cleaning Data Course Project
Daghan Altas

## Introduction
A team of researchers at the SmartLab Research Laboratory at the DITEN Department of the University of Genova have carried
out an experiment to record the daily activities of 30 subjects while they were going about their daily lives carrying a
waist-mounted smartphone with embedded inertial sensors and have built a Human Activity Recognition database.

Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the SmartLab team
captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz (a sample every 1.2 sec in time domain).

The sensor signals were processed using frequency and noise filters to decompose the readings into gravitational and body motion
components for acceleration and angular velocity. The full details of the filter parameters can be found in the original study.
The measurement data (features) are further normalized and bounded within [-1,1].

## Project objective
This project further summarizes data provided by the Smartlab Research Team.
For X,Y, and Z axis, the mean and standard deviation of the body acceleration (3 features), gravity acceleration (3 features) and
angular velocity (3 features) measurements are taken. An independent tidy data set with the average of each feature for each activity
and each subject is provided as the final result.

## Choice of features
While there are more than 60 feature columns representing  means and standard deviations, only 9 matched the criteria of actual _measurements_.
All other derived values including frequency domain data and jerk data has been ignored. The 9 values considered for the project are X,Y,Z
measurements for the body acceleration, gravity acceleration and angular velocity in time domain.

## Results
The final result is a tidy data table with 20 columns and 180 rows. It is output as "tidydata.txt" on the working directory.
First row represent the subject, second row represents the activity and the remaining 18 rows represent the average of the mean and
standard deviation features. The "tidydata.txt" file format is space delimited text file with the first line representing the header.

## How to produce the results
1. Make sure "UCI HAR Dataset" is in the current directory
2. In RStudion, source run_analysis.R
3. Run the Setup() function


## The dataset includes the following files:
- 'README.md'
- 'run_analysis.R': R script that will produce the tidy dataset
- 'codebook.md': List and explanation of all feature
- 'tidydata.txt': Links the class labels with their activity name.


## License:
Author would like to acknowledge the following team for the original work and data:
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
Original work and dataset can be found at: https://sites.google.com/site/smartlabunige/software-datasets/har-dataset
For more information about the original dataset, contact: activityrecognition@smartlab.ws
