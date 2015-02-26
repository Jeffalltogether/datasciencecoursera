### Assignment 3 test
setwd("C:/Users/jeffthatcher/Cloud Drive/RRepos/DataScience/ProgAssignment3")
source("best.R")

#Here is some sample output from the function.
best("TX", "heart attack")
        # "CYPRESS FAIRBANKS MEDICAL CENTER"
best("TX", "heart failure")
        # "FORT DUNCAN MEDICAL CENTER"
best("MD", "heart attack")
        # "JOHNS HOPKINS HOSPITAL, THE"
best("MD", "pneumonia")
        # "GREATER BALTIMORE MEDICAL CENTER"
best("BB", "heart attack")
        # Error in best("BB", "heart attack") : invalid state
best("NY", "hert attack")
        # Error in best("NY", "hert attack") : invalid outcome

source("rankhospital.R")
rankhospital("TX", "heart failure", 4)
        # [1] "DETAR HOSPITAL NAVARRO"
rankhospital("MD", "heart attack", "worst")
        # [1] "HARFORD MEMORIAL HOSPITAL"
rankhospital("MN", "heart attack", 5000)
        # [1] NA

source("rankall.R")
head(rankall("heart attack", 20), 10)

tail(rankall("pneumonia", "worst"), 3)

tail(rankall("heart failure"), 10)
