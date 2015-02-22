### Quiz 3

library(datasets)
data(iris)
str(iris)
head(iris)

debug(lm)
bool <- iris$Species == "virginica"
target <- c()
for (d in nrow(iris)) {
        if (bool[d] == TRUE){
                target(d) <- c(target, iris$Sepal.Length[d])
        }
}
mean(target)


library(datasets)
data(mtcars)
?mtcars
str(mtcars)
sapply(split(mtcars$mpg, mtcars$cyl), mean)
x <- sapply(split(mtcars$hp, mtcars$cyl), mean)
