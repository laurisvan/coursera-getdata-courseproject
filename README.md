# Getting and Cleaning Data Course Project

This project contains the code and resulting data of [Coursera Getting and Cleaning Data](https://class.coursera.org/getdata-015/) course project for tidying up the original dataset of [Human Activity Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) by UCI Machine Learning Repository.

Files included:
* [README.md](README.md): This file you are reading
* [CodeBook.md](CodeBook.md): The description of the variables and data transformations performed
* [run_analysis.R](run_analysis.R): The R source code file performing the analysis
* [analysis.txt](analysis.txt): Results of a sample run

# How it works

The code is written in [R programming language](http://www.r-project.org/) and uses [readr](http://cran.r-project.org/web/packages/readr/index.html) and [data.table](http://cran.r-project.org/web/packages/data.table/index.html) packages. If you do not yet have them, install them prior to proceeding.

The code first reads training and test data sets, their subject and activity labels from their own files into their own data frames. Then it binds them together, and selects a subset of the attributes (hand-parsed from the original list for all variables that contain "mean" or "std" in their name. Then it combines all the data frames together, and computes means for each data variable for each subject, each activity.

The code is commented, so you can follow these steps from [run_analysis.R](run_analysis.R) source code file.

An elaborate description of the data and the transformations are given in [CodeBook.md](CodeBook.md).

# Running the code

First set your working directory where you have unzipped the [Human Activity Using Smartphones Data Set](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). Then source the "run_analysis.R" source code file. As a result, it writes a file "analysis.txt" in the working directory.

A sample on how to execute things in your R shell (replace the paths with yours):

	> setwd("~/leisure/cleaning-data/courseproject/UCI HAR Dataset")
	> source('~/leisure/cleaning-data/courseproject/coursera-getdata-courseproject/run_analysis.R')

# Reading the results

The resulting file is a tidy, R readable dataset. You can read and view it as follows:

	> data <- read.table("analysis.txt", header=T)
	> View(data)
