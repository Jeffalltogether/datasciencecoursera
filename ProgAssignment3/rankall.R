## Write a function called rankall that takes two arguments: an outcome name (outcome) and a hospital 
# rank-ing (num). The function reads the outcome-of-care-measures.csv file and returns a 2-column data frame
# containing the hospital in each state that has the ranking specified in num. For example the function call
# rankall("heart attack", "best") would return a data frame containing the names of the hospitals that
# are the best in their respective states for 30-day heart attack death rates. The function should return a value
# for every state (some may be NA). The first column in the data frame is named hospital, which contains
# the hospital name, and the second column is named state, which contains the 2-character abbreviation for
# the state name. Hospitals that do not have data on a particular outcome should be excluded from the set of
# hospitals when deciding the rankings.

# Handling ties. The rankall function should handle ties in the 30-day mortality rates in the same way
# that the rankhospital function handles ties.
# The function should use the following template.

# setwd("C:/Users/jeffthatcher/Cloud Drive/RRepos/DataScience/ProgAssignment3")
# outcome = "pneumonia"
# num = "worst"

rankall <- function(outcome, num = "best") {
        ## Read outcome data
        data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        states <- unique(data$State)
        states <- states[order(states)]                   # Order the subsetted dataframe best to worst based on desired outcome
        
        ## Check that outcome, and rank are valid
        outcomes <- c("heart attack", "heart failure", "pneumonia")
        a = outcome %in% outcomes
        if (a == FALSE){
                stop("Invalid Outcome")
        } 
        
        numvals <- c("best", "worst", 1:length(data[,1]))
        b = num %in% numvals
        if (b == FALSE){
                stop("Invalid Rank")
        }

        ## Return hospital name in that state with the given rank
        ## 30-day death rate
        if (outcome == "heart attack"){
                outcomeData = data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack
        }
        if (outcome == "heart failure"){
                outcomeData = data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure
        }
        if (outcome == "pneumonia"){
                outcomeData = data$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia
        }
        suppressWarnings(sdata <- data.frame(data$State, data$Hospital.Name, as.numeric(outcomeData))) #must use as.numeric on `outcomeData` to prevent transferiing this into class `factor`
        y <- sdata[order(sdata$as.numeric.outcomeData),]           # Order the subsetted dataframe best to worst based on desired outcome
        y <- subset(y, y$as.numeric.outcomeData. != "NA")          # Remove incomplete data
        g <- split(y$as.numeric.outcomeData, y$data.State)         # Split the data into outcomes for each state
                                                                        
        ## For each state, find the hospital of the given rank
        # Dealing with "best"
        if (num == "best"){
                num = 1
        }

        # Dealing with "worst"
        if (num == "worst"){
                #get the rank value for each state
                x <- c()
                result <- c()
                for (i in 1:length(g)){
                        x <- subset(y, y$data.State == states[i])
                        x <- x[order(x$data.Hospital.Name),]         # Reorder data to deal with ties
                        x <- x[order(x$as.numeric.outcomeData.),]    # Reorder data to deal with ties
                        result[i] <- c(as.list(x[length(x[,2]),2]))
                 }
        } else {
                #get the rank value for each state
                x <- c()
                result <- c()
                for (i in 1:length(g)){
                        x <- subset(y, y$data.State == states[i])
                        x <- x[order(x$data.Hospital.Name),]         # Reorder data to deal with ties
                        x <- x[order(x$as.numeric.outcomeData.),]    # Reorder data to deal with ties
                        result[i] <- c(as.list(x[as.numeric(num),2]))
                }
                
        }
answer <- data.frame(unlist(result), states)
colnames(answer) <- c("Hospital", "State")
return(answer)
}