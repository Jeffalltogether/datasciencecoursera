### R Programming Assignment 1
# Write a function named 'pollutantmean' that calculates the mean of a pollutant 
# (sulfate or nitrate) across a specified list of monitors. The function 'pollutant
# mean' takes three arguments: 'directory', 'pollutant', and 'id'. Given a vector 
# monitor ID numbers, 'pollutantmean' reads that monitors' particulate matter data
# from the directory specified in the 'directory' argument and returns the mean of
# the pollutant across all of the monitors, ignoring any missing values coded as 
# NA. A prototype of the function is as follows

 setwd("C:/Users/jeffthatcher/Cloud Drive/RRepos/DataScience/specdata") 
 
 source("pollutantmean_2.R")
 xxx <- pollutantmean( "C:/Users/jeffthatcher/Cloud Drive/RRepos/DataScience/specdata","nitrate", 7:72)
 head(xxx)
 
 source("complete_2.r")
 yyy <- complete("C:/Users/jeffthatcher/Cloud Drive/RRepos/DataScience/specdata", c(2, 4, 8, 10, 12))
 head(yyy)
 
 source("corr_2.r")
 zzz <- corr("C:/Users/jeffthatcher/Cloud Drive/RRepos/DataScience/specdata", 5)
 head(zzz) 
