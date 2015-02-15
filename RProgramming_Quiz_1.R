## R Programming Quiz 1
#load quiz data
data <- read.csv("C:/Users/jeffthatcher/Cloud Drive/CourseERA/2_R_Programming/hw1_data.csv")

#In the dataset provided for this Quiz, what are the column names of the dataset?
colnames(data)

#Extract the first 2 rows of the data frame and print them to the 
# console. What does the output look like?
data2 <- data[1:2,]
data2

#How many observations (i.e. rows) are in this data frame?
tail(data)

#Extract the last 2 rows of the data frame and print them 
# to the console. What does the output look like?
data3 <- data[152:153,]
data3

#What is the value of Ozone in the 47th row?
data$Ozone[47]

#How many missing values are in the Ozone column of this data frame?
missingNA <- is.na(data$Ozone)
as.numeric(missingNA)
sum(missingNA)

missingNAN<- is.nan(data$Ozone)
as.numeric(missingNAN)
sum(missingNAN)

#What is the mean of the Ozone column in this dataset? Exclude 
# missing values (coded as NA) from this calculation.
Ozone <- na.omit(data$Ozone)
as.numeric(Ozone)
mean(Ozone)

#Extract the subset of rows of the data frame where Ozone values are above 31 and Temp 
# values are above 90. What is the mean of Solar.R in this subset?

data.subO <- data[data$Ozone > 31, , drop = FALSE]
data.subTO <- data.subO[data.subO$Temp > 90, , drop = FALSE]
data.subTOO <- na.omit(data.subTO)
mean(data.subTOO$Solar.R)

#What is the mean of "Temp" when "Month" is equal to 6?
data.June <- data[data$Month == 6, , drop = FALSE]
mean(data.June$Temp)

#What was the maximum ozone value in the month of May (i.e. Month = 5)?
data.May <- data[data$Month == 5, , drop = FALSE]
data.MayO <- na.omit(data.May)
max(data.MayO$Ozone)
