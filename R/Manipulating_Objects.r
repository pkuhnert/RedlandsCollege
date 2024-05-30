#-------------------------------------------------------------------------------
# This script contains material for manipulating objects in R
# Author: Petra Kuhnert
# Date: 30 May 2024
#-------------------------------------------------------------------------------

# Sorting

set.seed(100)
x <- sample(1:5, 20, rep=T)
y <- sample(1:5, 20, rep=T)
z <- sample(1:5, 20, rep=T)
xyz <- rbind(x, y, z)
dimnames(xyz)[[2]] <- letters[1:20]
xyz

o <- order(x, y, z)
xyz[, o]

sort(x)

sort(x, decreasing = T)

sort(x, partial = c(3,4))  # done for efficiency

# Ranking
rank(x)

rank(x, ties = "first")   # first occurence wins
rank(x, ties = "random")  # ties broken at random
rank(x, ties = "min")     # typical sports ranking

#-------------------------------------------------------------------------------
# Dates and times

# Birthday example
myBday <- strptime("27-Mar-2015", "%d-%b-%Y")
class(myBday)

myBday

weekdays(myBday)

Sys.time()

Sys.time() - myBday

#------------------------------------------------------------------------------
# Tabulating data
attach(quine)
?quine

table(Age)

table(Sex, Age)

#------------------------------------------------------------------------------
# Splitting data

split(Days, Sex)

# Boxplot of the data by sex
ggplot(quine, aes(Days, Sex)) + geom_boxplot()

# Boxplot of the data by age and sex
ggplot(quine, aes(Days, Age)) + geom_boxplot() +
  facet_wrap(~ Sex)


#------------------------------------------------------------------------------
# with, subset and transform functions

with(Cars93,plot(Weight,100/MPG.highway))

Vans <- subset(Cars93, Type == "Van")

Cars93T <- transform(Cars93,
                       WeightT=Weight/1000)

#------------------------------------------------------------------------------
# Vectorised calculations

# The apply function
iris[1:4,]

apply(iris[,-5], 2, mean)

# The tapply function
quine[1:5,]

tapply(Days, Age, mean)

tapply(Days, list(Sex, Age), mean)

# lapply and sapply functions
l <- list(Sex = Sex, Eth = Eth)
lapply(l, table)


l <- list(Sex = Sex, Eth = Eth)
sapply(l, table)

