# DataSet-Analysis-for-Human-Activity-Recognition-Using-Smartphones-Dataset

Loads the datasets from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
and carries out instructions in the Course 3 (Getting and Cleaning Data Course Project) 
Week 4 Assignment https://www.coursera.org/learn/data-cleaning/peer/FIZtT/getting-and-cleaning-data-course-project

### Important
In order to run the data analysis make sure that the dataset 
"UCI HAR Dataset" is present in your working directory. The dataset is 
available here

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


### Codebooks
The codebook ``Codebook.md`` is included in this repo. In order to get a better understanding of the data please review that and go over the features.info and features.txt files in the dataset linked above.  

### Run
Use the following commands in R to run the analysis

``
source("run_analysis.R")
run_analysis()
``

### Output
The analysis will result in a file called tidy_data.txt


### Reading the processed data
The tidy_data.txt dataset can be read using

``
data <- read.table(file_path, header = TRUE)
``