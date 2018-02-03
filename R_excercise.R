## Generate a uniform random number
x <- runif(1, 0, 10)
if(x > 3){
  y <- 10
} else {
  y <- 0
}

# Generate a normally distributed number
# This loop takes the i variable and in each iteration of the loop gives it values 1, 2, 3, ., 10,
# executes the code within the curly braces, and then the loop exits.

numbers <- rnorm(10)
for(i in 1:10){
  print(numbers[i])
}

x <- c("a", "b", "c", "d")
for(i in 1:4){
  ## Print out each element of 'x'
  print(x[i])
}

## Generate a sequence based on length of 'x'
for(i in seq_along(x)) {
  print(x[i])
}

# For one line loops, the curly braces are not strictly necessary.
for(i in 1:4) print(x[i])

# Nested for loops
x <- matrix(1:6, 2, 3)
for(i in seq_len(nrow(x))) {
  for(j in seq_len(ncol(x))) {
  }
  print(x[i, j])
}

# Next statement
for(i in 1:100){
  if(i <= 20){
  
  ## Skip the first 20 iterations
  next
}
print(i)}

# Break statement
for(i in 1:100){
  print(i)

if(i > 20){
  ## Stop loop after 20 iterations
  break
}}

# While loop
count <- 0
while(count < 10) {
  print(count)
  count <- count + 1
}

# While loop with conditionconditionCall(z <- 5
z<-7
set.seed(1)
while(z >= 3 && z <= 10) {
  coin <- rbinom(1, 1, 0.5)
  if(coin == 1) { ## random walk
    z <- z + 1
    } else {
      z <- z - 1
    }
  }
print(z)

# Loop functions

#lapply
x <- list(a = 1:5, b = rnorm(10))
lapply(x, mean)

# another example
x <- list(a = 1:4, b = rnorm(10), c = rnorm(20, 1), d = rnorm(100, 5))
lapply(x, mean)

# use lapply() to evaluate a function multiple times each with a different argument. 
x <- 1:4
lapply(x, runif)

# the min = 0 and max = 10 arguments are passed down to runif() every time it gets called.
x <- 1:4
lapply(x, runif, min = 0, max = 10)

# use of anonymous functions(on the fly function-function diasappears from workspace) 
x <- list(a = matrix(1:4, 2, 2), b = matrix(1:6, 3, 2))
lapply(x, function(elt) { elt[,1] })

# alternative way-function is not anonymous
f <- function(elt) {
  elt[, 1]
  }
lapply(x, f)

#split function
x <- c(rnorm(10), runif(10), rnorm(10, 1))
f <- gl(3, 10)
split(x, f)

lapply(split(x, f), mean)

# Spliting a dataframe
library(datasets)
head(airquality)

s <- split(airquality, airquality$Month)
str(s)

lapply(s, function(x) {
  colMeans(x[, c("Ozone", "Solar.R", "Wind")])
})

sapply(s, function(x) {
  colMeans(x[, c("Ozone", "Solar.R", "Wind")])
})

# Tapply
x <- c(rnorm(10), runif(10), rnorm(10, 1))
f <- gl(3, 10)
tapply(x, f, mean)

tapply(x, f, mean, simplify = FALSE)

x <- matrix(rnorm(200), 20, 10)
apply(x, 2, mean) ## Take the mean of each column

apply(x, 1, sum) 

#DPLYR
chicago <- readRDS("chicago.rds")
dim(chicago)
str(chicago)

names(chicago)[1:3]
subset <- select(chicago, city:dptp)
head(subset)

select(chicago, -(city:dptp))

i <- match("city", names(chicago))
j <- match("dptp", names(chicago))
head(chicago[, -(i:j)])


subset <- select(chicago, ends_with("2"))
str(subset)

subset <- select(chicago, starts_with("d"))
str(subset)

chic.f <- filter(chicago, pm25tmean2 > 30)
str(chic.f)

summary(chic.f$pm25tmean2)

chic.f <- filter(chicago, pm25tmean2 > 30 & tmpd > 80)
select(chic.f, date, tmpd, pm25tmean2)


chicago <- arrange(chicago, date)

head(select(chicago, date, pm25tmean2), 3)

tail(select(chicago, date, pm25tmean2), 3)

chicago <- arrange(chicago, desc(date))

head(select(chicago, date, pm25tmean2), 3)
tail(select(chicago, date, pm25tmean2), 3)


head(chicago[, 1:5], 3)
chicago <- rename(chicago, dewpoint = dptp, pm25 = pm25tmean2)
head(chicago[, 1:5], 3)


chicago <- mutate(chicago, pm25detrend = pm25 - mean(pm25, na.rm = TRUE))
head(chicago)


head(transmute(chicago,pm10detrend = pm10tmean2 - mean(pm10tmean2, na.rm = TRUE),o3detrend = o3tmean2 - mean(o3tmean2, na.rm = TRUE)))


chicago <- mutate(chicago, year = as.POSIXlt(date)$year+1900)
head(chicago)
years <- group_by(chicago, year)


summarize(years, pm25 = mean(pm25, na.rm = TRUE),
          o3 = max(o3tmean2, na.rm = TRUE),
          no2 = median(no2tmean2, na.rm = TRUE))

# Pipeline operator illustration
l=mutate(chicago, month = as.POSIXlt(date)$mon + 1) %>%
  group_by(month) %>%
  summarize(pm25 = mean(pm25, na.rm = TRUE),
            o3 = max(o3tmean2, na.rm = TRUE),
            no2 = median(no2tmean2, na.rm = TRUE))








