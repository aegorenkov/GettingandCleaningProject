## Download Samsung Galaxy S Smartphone data available at
## http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

#Set working directory
setwd("~/GettingandCleaningProject/")

#Download Galaxy Smartphone accelerometer data
url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
file_name <- 'accelerometer.zip'
wd <- 'Data/'
dest <- paste0(wd, file_name)

download.file(url = url,
              destfile = dest, 
              method = 'curl')

#Unzip smartphone data for use in run_analysis.R
unzip(zipfile = dest, exdir = 'Data')