### R Programming Assignment 1
# Write a function named 'pollutantmean' that calculates the mean of a pollutant 
# (sulfate or nitrate) across a specified list of monitors. The function 'pollutant
# mean' takes three arguments: 'directory', 'pollutant', and 'id'. Given a vector 
# monitor ID numbers, 'pollutantmean' reads that monitors' particulate matter data
# from the directory specified in the 'directory' argument and returns the mean of
# the pollutant across all of the monitors, ignoring any missing values coded as 
# NA. A prototype of the function is as follows

 setwd("C:/Users/jeffthatcher/Cloud Drive/RRepos/DataScience")
 
 source("pollutantmean.r")
 
 directory <- "C:/Users/jeffthatcher/Cloud Drive/CourseERA/2_R_Programming/specdata/"
 
 pollutant <- "sulfate"     
