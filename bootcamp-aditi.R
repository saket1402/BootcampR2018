#Assignment operator
x <- 1

#Explicit Print
print(x)

#Auto Print
x

#What is the [1] for?
# ->Depicts a vector but not part of it

#Sequence
x<- 1:20
x

#Infinite
1/Inf

#NAN
0/0

#Vector
x <- c(1.5,2.3) #numeric
x <- c(TRUE,FALSE)
x <- c("a","b","c")
x <- vector()

class(x)
length(x)

#Implicit Coercion
y <- c(1.7, "a")
y <- c(TRUE, 2)
y <- c("a", TRUE)

class(y)

#Explicit Coercion
x <- 0:6 
class(x)

as.numeric(x)
as.logical(x)

x <- c("a","b","c")
as.numeric(x)

#Matrices

m <- matrix(1:6, nrow = 2, ncol = 3)
m

dim(m)
attributes(m)

#Creating a matrix from a vector
m <- 1:10
m

dim(m) <- c(2,5)
m

x <- 1:3
y <- 10:12
cbind(x,y)
rbind(x,y)

#List
x<- list(1, "A", TRUE, 1+4i)
x


#Factors
x <- factor(c("yes","yes","no","no","yes"))
x
table(x)
unclass(x)
x <- factor(c("yes","yes","no","no","yes"), levels = c("yes", "no"))
x
unclass(x)

#Missing values
x <- c(1, 2, NA, 10, 3)

is.na(x)
is.nan(x)

#Data Frames
x <- data.frame(foo = 1:4, bar= c(T,T,F,F))
x
attributes(x)

#Names
names(x)
names(x) <- c("A","B")
x

x <- list(Boston = 1, London = 2)
x
x$Boston
x[1]

dimnames(m) <- list(c("a","b"), c("c","d","e","f","g"))
m

rownames(m) <- c("row1", "row2")
m

#Read and Write data
getwd()
setwd("C:/Users/aditi/Desktop/Adv BA with R")
dept <- read.table("departments.txt", header = FALSE, sep=" ")
write.csv(dept, file = "deptdata.csv")

#Subsets
#1. Vectors
x <- c("a","b","c","d")
x[1]
x[1:3]
x[c(3,4)]

u <- x > "a"
x[u]

#2. Matrix
x<- matrix(1:6, 2, 3)
x
x[1,]
x[,2]

#3. List
x <- list(foo=1:4, bar=0.6, baz="hello")
x
x[[1]]
x[["bar"]]
x[1]
x$bar
x[c(1,3)]

#4. Partial Matching
x <- list(aardvark = 1:5)
x$a
x[["a"]]
x[["aar", exact = FALSE]]

#5. Removing NA
x <- c(1,2,NA,3,NA,4)
bad <- is.na(x)
bad
x[!bad]

#6. Complete cases - Incase you have more than one R object 
x <- c(1, 2, NA, 4, NA, 5)
y <- c("a", "b", NA, "d", NA, "f")
good <- complete.cases(x, y)
good
x[good]
y[good]


#7. Subset function
subset(x, x>3)

#Date and Time
x <- as.Date("1970-01-01")
x
unclass(as.Date("1970-01-02"))

x <- Sys.time()
x
class(x)

unclass(x) #in POSIXct format

p <- as.POSIXlt(x)
names(unclass(p))
p$wday

datestring <- c("January 10, 2012 10:40", "December 9, 2011 9:10")
x <- strptime(datestring, "%B %d, %Y %H:%M")
?strptime
x


#Clearing out Environment
rm(list=ls())



