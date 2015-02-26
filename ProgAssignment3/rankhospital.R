### Part 3
# Write a function called rankhospital that takes three arguments: the 2-character abbreviated name of a
# state (state), an outcome (outcome), and the ranking of a hospital in that state for that outcome (num).
# The function reads the outcome-of-care-measures.csv file and returns a character vector with the name
# of the hospital that has the ranking specified by the num argument. For example, the call
# rankhospital("MD", "heart failure", 5)
# would return a character vector containing the name of the hospital with the 5th lowest 30-day death rate
# for heart failure. The num argument can take values \best", \worst", or an integer indicating the ranking
# (smaller numbers are better). If the number given by num is larger than the number of hospitals in that
# state, then the function should return NA. Hospitals that do not have data on a particular outcome should
# be excluded from the set of hospitals when deciding the rankings.

# Handling ties. It may occur that multiple hospitals have the same 30-day mortality rate for a given cause
# of death. In those cases ties should be broken by using the hospital name. For example, in Texas (\TX"),
# the hospitals with lowest 30-day mortality rate for heart failure are shown here.

rankhospital <- function(state, outcome, num = "best") {
        ## Read outcome data
        data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        
        ## Check that state, outcome, and rank are valid
        a = state %in% data$State
        if (a == FALSE){
                stop("Invalid State")
        }
        
        outcomes <- c("heart attack", "heart failure", "pneumonia")
        b = outcome %in% outcomes
        if (b == FALSE){
                stop("Invalid Outcome")
        } 
        
        numvals <- c("best", "worst", 1:length(data$State))
        c = num %in% numvals
        if (c == FALSE){
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
        x <- subset(sdata, sdata$data.State == state)           # Gather rows with the desired state
        x <- subset(x, x$as.numeric.outcomeData. != "NA")       # Remove incomplete data
        x <- x[order(x$data.Hospital.Name),]                    # Reorder data to deal with ties
        x <- x[order(x$as.numeric.outcomeData.),]               # Reorder data to deal with ties
        
        ## rate
        # Return hospital with desired rank 
        # Dealing with "best"
        if (num == "best"){
                num = 1
        }
        # Dealing with "worst"
        if (num == "worst"){
                result <- c(as.list(x[length(x[,2]),2]))
        } else {
                result <- c(as.list(x[as.numeric(num),2]))
        }
answer <- as.character(unlist(result))
return(answer)
}