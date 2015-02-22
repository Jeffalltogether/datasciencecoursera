### Swirl Practice for R-Programming Coursera

library(swirl)
swirl()

## Workspace and Files
getwd()
ls()          # list all the objects in your local workspace
list.files()  # lists all files in working directory
args()
dir.create()
setwd()
file.create()
file.exists()
file.info()
file.info("mytest.R")$mode  # --- to grab specific items
file.rename()
file.copy()
file.path()
dir.create("testdir2/testdir3", recursive = TRUE)  #Create a directory in the current working directory and a subdirectory
unlink("testdir2", recursive = TRUE)               # Delete the directory
     # you need the recursive = TRUE argument. Otherwise, R is concerned that you are 
     # unaware that, when deleting testdir2, you are also deleting testdir3, which is 
     # nested within it.

## Sequences of numbers
seq( , length = 100)
length()
seq_along()
rep( , times = 100, each = 100)

## Vectors
c()
paste( , collapse = " ")

## Logical Operators
     # The `<` and `>=` symbols in these examples are called 'logical operators'. Other logical operators include `>`,
     # `<=`, `==` for exact equality, and `!=` for inequality.
     # If we have two logical expressions, A and B, we can ask whether at least one is TRUE with A | B (logical 'or'
     # a.k.a. 'union') or whether they are both TRUE with A & B (logical 'and' a.k.a. 'intersection'). Lastly, !A is the
     # negation of A and is TRUE when A is FALSE and vice versa.

## Missing Values
rnorm(1000) # a vector containing 1000 draws from a standard normal distribution
sample()    # select X elements at random combining y and z
is.na()
sum()

## Subsetting Vectors
x[!is.na(x)]    # removes the NA values from x
y[y > 0]        # A vector of all the positive elements of y
                # Since NA is not a value, but rather a placeholder for an unknown quantity, the
                # expression NA > 0 evaluates to NA.
x[c(3, 5, 7)]   # how we'd subset the 3rd, 5th, and 7th elements of x
x[-c(2, 10)]    # all elements of x EXCEPT for the 2nd and 10 elements
c(foo = 11, bar = 2, norf = NA)  # a numeric vector with three named elements
names()
identical()
vect[c("foo", "bar")]            # subset a vector using the names

## Vectors and Dataframes
dim() # rows and columns
dim(my_vector) <- c(4, 5)   #gives a vector dimension attributes
attributes()
class()
matrix()
cbind()                     # uses 'implicit coercion'
data.frame()
colnames()
colnames(my_data) <- cnames # assigns column names

## Logic
TRUE && c(TRUE, FALSE, FALSE)  #&& only evaluates the first value of the vector, not recursive as in `&`
TRUE || c(TRUE, FALSE, FALSE)  #|| is not vectorized, while `|` is
        # All `&` operators are evaluated prior to `|` operators
isTRUE()
xor()   # The xor() function stands for exclusive OR; If one argument evaluates to
        # TRUE and one argument evaluates to FALSE, then this function will return TRUE,
        # otherwise it will return FALSE.
sample() # creates a random sampling of integers from 1 to X without replacement
which()  #returns the indices of the vector that are TRUE
any(x < _)
all()

## lapply and sapply 
head()
viewinfo() # To open a more complete description of the dataset in a separate text file
cls_list <- lapply(flags, class) # to apply the class() function to each column of
                                 # the flags dataset and store the result in a variable called cls_list
as.character()
cls_vect <- sapply(flags, class) # stores the results of lapply in a vector
 # Note the comma before 11:17. 
flag_colors <- flags[, 11:17] # This subsetting command tells R that we want all rows,
                              # but only columns 11 through 17.
range()  # returns the minimum and maximum of its first argument
unique() # returns a vector with all duplicate elements removed
lapply(unique_vals, function(elem) elem[2]) # anonymous function embedded in the lapply function that returns the second element of each column in unique_vals
sapply(split(mtcars$mpg, mtcars$cyl), mean) # calculate the average miles per gallon (mpg) by number of cylinders in the car (cyl)

## vapply and tapply
vapply()                                # Whereas sapply() tries to 'guess' the correct format of the result,
vapply(flags, unique, numeric(1))       # vapply() allows you to specify it explicitly.

tapply()        # As a data analyst, you'll often wish to split your data up 
                # into groups based on the value of some variable, then
                # apply a function to the members of each group
table()

tapply(flags$animate, flags$landmass, mean) # the proportion of flags containing an animate image WITHIN each landmass group

##  Looking at Data
dim()
nrow()
ncol()
object.size()
names()
head(x, 10)
tail(x, 10)
summary()
table(x$x)
str() # structure of data set including variables, factors, levels, and observations

## Simulation
sample()
sample(1:6, 4, replace = TRUE) # simulate rolling four six-sided dice
sample(LETTERS) # permutation of the elements in the vector LETTERS
sample(c(0,1), 100, replace = TRUE, prob = c(0.3, 0.7)) # assign probabilities to the values of the vector being sampled
rbinom() #simulate a random binomial variable
rbinom(n = 1, size = 100, prob = 0.7) # you only specify the probability of 'success' (heads/1)
rnorm(n = x, mean = x, stdev = x)
rpois() #poisson distribution
replicate()
replicate(100, rpois(5, 10))
colMeans()
hist()
rexp() # exponential distribution
rchisq() # chi-squared distribution
rgamma() # gamma distributtion

# Dates and Times
Sys.Date() #get today's date "year - month - day"
unclass() # to see what the variables looks like internally, for dates it's the number of days since 1970-01-01
as.Date("1969-01-01") # reference a prior date
Sys.time() #current date and time 
as.POSIXlt(Sys.time())
x$min # access the minutes
weekdays()
months()
quarters()
strptime() # converts character vectors to POSIXlt
strptime(x, "%B %d, %Y %H:%M")
difftime() # allows you to specify a 'units' parameter
difftime(Sys.time(), t1, units = 'days')

## Base Graphics
# ggplot2 tutorial http://varianceexplained.org/r/teach_ggplot2_to_beginners/
plot()
plot(x = cars$speed, y = cars$dist, xlab = "Speed", ylab = "Stopping Distance")
plot(cars, main = "My Plot", sub ="My Plot Subtitle")
plot(cars, col = 2)
plot(cars, xlim = c(10, 15))
plot(cars, pch = 2)
boxplot(mpg ~ cyl, mtcars) #using a "formula" as an argument
hist()
hist(mtcars$mpg)
