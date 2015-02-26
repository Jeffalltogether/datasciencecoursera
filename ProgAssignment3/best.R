### Part 2
# Write a function called best that take two arguments: the 2-character abbreviated name of a state and an
# outcome name. The function reads the outcome-of-care-measures.csv file and returns a character vector
# with the name of the hospital that has the best (i.e. lowest) 30-day mortality for the specified outcome
# in that state. The hospital name is the name provided in the Hospital.Name variable. The outcomes can
# be one of \heart attack", \heart failure", or \pneumonia". Hospitals that do not have data on a particular
# outcome should be excluded from the set of hospitals when deciding the rankings.

# Handling ties. If there is a tie for the best hospital for a given outcome, then the hospital names should
# be sorted in alphabetical order and the first hospital in that set should be chosen 
# (i.e. if hospitals \b", \c", and \f" are tied for best, then hospital \b" should be returned).

# The function should check the validity of its arguments. If an invalid state value is passed to best, the
# function should throw an error via the stop function with the exact message \invalid state". If an invalid
# outcome value is passed to best, the function should throw an error via the stop function with the exact
# message \invalid outcome".


best <- function(state, outcome) {
        
        ## Read outcome data
        data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        
        ## Check that state and outcome are valid
        x = state %in% data$State
        outcomes <- c("heart attack", "heart failure", "pneumonia")
        y = outcome %in% outcomes
        if (x == FALSE){
                stop("Invalid State")
        }
        if (y == FALSE){
                stop("Invalid Outcome")
        } 
        
        ## Return hospital name in that state with lowest 30-day death
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
        z <- subset(sdata, data$State == state)      # Gather rows with the desired state
        
        ## rate
        zz <- c()
        for (i in 1:length(z)){
                zz <- z[i] == min((z[,3]), na.rm = TRUE) #compate the oucome data to the minimum
        }
        result <- data.frame(z[,2], zz)
        fresult <- subset(result, result[,2] == TRUE)

        # Tie Breaker by "alphabetical"
        afresult <- fresult[order(fresult$z...2.),] #Alphabetize results data frame
        answer <- as.character(unlist(afresult[1,1]))
        return(answer)
}
