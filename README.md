
# Introduction

This repository contains files for the Coursera [Getting and Cleaning Data]([https://class.coursera.org/getdata-004) course project.

The project is designed to illustrate the basics of combining, extracting and aggregating data from a human activity dataset provided by the instructor: [UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata/projectfiles/UCI%20HAR%20Dataset.zip)

# Files
|Filename           |Description |
|-------------------|------------|
|**run_analysis.R**|contains the R code to process the UCI HAR Dataset|
|**CodeBook.md**|a description of the data including calculations used to summarize the data|
|TidyAverages.txt|Output of data transformation in tidy format.|

### How to run the script
From [R](http://www.r-project.org/) or [RStudio](http://www.rstudio.com/) console

1. Set your working directory to the UCI HAR Dataset directory
2. Enter `source("run_analysis.R")`

### Output
The script will create a tab-delimited file in your working directory called `TidyAverages.txt`

--------------------------------
# Data Source
The origial data is available from:
 http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
 
[Citation]
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz.
*Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly 
Support Vector Machine. International Workshop of Ambient Assisted Living*
(IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
http://www.icephd.org/sites/default/files/IWAAL2012.pdf
