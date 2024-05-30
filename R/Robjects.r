#-------------------------------------------------------------------------------
# This script contains material related to creating and manipulating R objects
# Author: Petra Kuhnert
# Date: 30 May 2024
#-------------------------------------------------------------------------------

# creating vectors using the 'c' function
value.num <- c(3,4,2,6,20)
value.char <- c("koala", "kangaroo", "echidna")
value.logical.1 <- c(F,F,T,T)
value.logical.2 <- c(FALSE,FALSE,TRUE,TRUE)

# creating vectors using the 'rep' and 'seq' functions
value <- rep(5,6)
value
seq(from=2,to=10,by=2)

1:5

seq(from = 2, to = 10, length = 5)

seq(along = value)

# vectors can be created using a combination of these functions
value <- c(1, 3, 4, rep(3,4), seq(from = 1, to = 6, by = 2))
value

# Note: elements of a vector are expected to be of the same mode
c(1:3, "a", "b", "c") # produces an error

# An example using the scan function.  On return you will be prompted to enter
# in some numbers.
value <- scan()

value

#-----------------------------------------------------------------------------

# Basic computation with numerical vectors

set.seed(145) # setting the seed so you generate the same set of numbers each time
x <- runif(10)
x

y < 2*x + 1	# recycling short vectors
y

z <- (x-mean(x))/sd(x)	# see also 'scale'
z

mean(z)  # taking the average

sd(z)    # computing the standard deviation


#-----------------------------------------------------------------------------

# Creating matrices using dim and matrix functions

value <- rnorm(6)
dim(value) <- c(2,3)
value

dim(value) <- NULL  # convert back to a vector

matrix(value, 2, 3)  # convert vector to a matrix

matrix(value, 2, 3, byrow = T) # fill a matrix by rows


# Creating matrices using rbind and cbind
value <- matrix(rnorm(6), 2, 3, byrow = T) # bind a row onto an existing matrix
value2 <- rbind(value, c(1,1,2))
value2

value3 <- cbind(value2, c(1, 1, 2)) # binding a column onto an already existing matrix

#-----------------------------------------------------------------------------

# Creating dataframes
value3 <- data.frame(value3)
value3


value4 <- data.frame(rnorm(3), runif(3))
value4

names(value3)

names(value3) <- c("C1", "C2", "C3", "C4")
row.names(value3)

row.names(value3) <- c("R1","R2","R3") # renaming

data.frame(C1 = rnorm(3), C2 = runif(3),	row.names = c("R1", "R2", "R3"))


#-----------------------------------------------------------------------------

# The Iris dataset - an example

dimnames(iris3)

Snames <- dimnames(iris3)[[3]]

# Convert into a 150 x 3 matrix
iris.df <- rbind(iris3[,,1], iris3[,,2], iris3[,,3])

# Coerce the matrix into a data frame and check the variable names
iris.df <- as.data.frame(iris.df)
names(iris.df)

# Make a species factor and bind it to the columns of this matrix
iris.df$Species <- factor(rep(Snames, rep(50,3)))


# examining first 5 rows of the data
iris.df[1:5,]
head(iris.df)  # will extract the first 6 rows

# Now producing a pairwise plot of the data

pairs(iris.df[1:4],
      main = "Anderson's Iris Data",
      pch = 21,bg = c("red",
                      "green3","blue")[unclass(iris$Species)])


#-----------------------------------------------------------------------------#

# Accessing elements of a vector or matrix
x <- sample(1:5, 20, rep=T)
x

x == 1

ones <- (x == 1)	# parentheses unnecessary

x[ones] <- 0
x


others <- (x > 1)	# parentheses unnecessary
y <- x[others]
y

which(x > 1)

# Indexing matrices and dataframes
value3

value3[, "C1"] <- 0
value3

value3["R1", ] <- 0
value3

value3[] <- 1:12
value3

value3[1:2,]  # accessing first two rows
value3[, 1:2] # accessing first two columns
as.vector(value3[value3 > 5]) # element with a value > 5

#------------------------------------------------------------------------------

# Creating lists
L1 <- list(x = sample(1:5, 20, rep=T),
           y = rep(letters[1:5], 4), z = rpois(20, 1))
L1

# accessing the first component of a list
L1[["x"]]
L1$x
L1[[1]]

L1[1] # sublist consisting of first component only

# Working with lists
length(L1)
names(L1) <- c("Item1","Item2","Item3")

L1$Item1[L1$Item1 > 2]

# Joining two lists

L2 <- list(x = c(1,5,6,7), y = c("apple","orange","melon","grapes"))
c(L1, L2)

append(L1, L2, after = 2)

# Adding elements to a list
L1$Item4 <- c("apple", "orange", "melon", "grapes")

L1[[4]] <- c("apple", "orange", "melon", "grapes")
names(L1)[4] <- c("Item4")

L1[["Item4"]] <- c("apple", "orange", "melon", "grapes")

#-----------------------------------------------------------------------------

# Cars93 Data Example
library(MASS)
attach(Cars93)

dw5 <- spline(density(Weight, width = 500))  # list
dw10 <- spline(density(Weight, width = 1000)) # list
rx <- range(dw5$x, dw10$x)
ry <- range(dw5$y, dw10$y)
plot(dw5, type = "n", xlim = rx, ylim = ry, cex = 1.5,
       xlab = "Weight", ylab = "Density")
lines(dw5, lty = 1, col = "blue")
lines(dw10, lty = 2, col = "red")
segments(Weight, 0.00001, Weight, 0, col = "green")
legend(locator(1), c("500kg window", "1000kg window"), lty = 1:2)

detach("Cars93")



