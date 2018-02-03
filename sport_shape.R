setwd("G:/Bootcamp R/Assignments/Assignments/Assignment - 5")
library(rgdal)
lnd <- readOGR(dsn = "Event_sport_shape/london_sport.shp")
lnd <- readOGR(dsn = "Event_sport_shape", layer = "london_sport")
head(lnd@data, n = 2)
mean(lnd$Partic_Per) # short for mean(lnd@data$Partic_Per) 
sapply(lnd@data, class)
lnd$Pop_2001 <- as.numeric(as.character(lnd$Pop_2001))
nrow(lnd)
ncol(lnd)
lnd@proj4string
plot(lnd)
# select rows of lnd@data where sports participation is less than 17
lnd@data[lnd$Partic_Per < 17, 1:3]

# Select zones where sports participation is between 20 and 25%
sel <- lnd$Partic_Per > 20 & lnd$Partic_Per < 25
plot(lnd[sel, ]) # output not shown here
head(sel)

plot(lnd, col = "lightgrey") # plot the london_sport object
sel <- lnd$Partic_Per > 25
plot(lnd[ sel, ], col = "turquoise", add = TRUE) # add selected zones to map
