# install.packages("arules")
library(arules)
groceries <- read.transactions("G:/Bootcamp R/PowerBI/groceries.csv", sep = ",")
summary(groceries)

inspect(groceries[1:5])
itemFrequencyPlot(groceries, support = 0.1)
itemFrequencyPlot(groceries, topN =20)
groceryrules <- apriori(groceries, parameter = list(supp = 0.006, conf = 0.25,target="rules"))


groceryrules
summary(groceryrules)
inspect(sort(groceryrules,by="lift")[1:20])
