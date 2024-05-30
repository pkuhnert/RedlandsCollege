#-------------------------------------------------------------------------------
# This script contains material related to the grammar of graphics
# Author: Petra Kuhnert
# Date: 30 May 2024
#-------------------------------------------------------------------------------
library(ggplot2)


# Example of a plot produced by base R
plot(iris$Sepal.Length, iris$Sepal.Width, type = "n")
points(iris$Sepal.Length[iris$Species == "setosa"], iris$Sepal.Width[iris$Species == "setosa"],
       col = "red", pch = 16)
points(iris$Sepal.Length[iris$Species == "versicolor"], iris$Sepal.Width[iris$Species == "versicolor"],
       col = "green", pch = 16)
points(iris$Sepal.Length[iris$Species == "virginica"], iris$Sepal.Width[iris$Species == "virginica"],
       col = "blue", pch = 16)
legend("topright", c("setosa", "versicolor", "virginica"), pch = 16, col = c("red", "green", "blue"))

# Example of a plot using ggplot2
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) + geom_point(size = 2) +
  theme_bw()

#---------------------------------------------------------------------------------
# Displaying univariate data

# Histogram - base R
hist(iris$Sepal.Length)

# Histogram - ggplot2
ggplot(iris, aes(x = Sepal.Length)) +
  geom_histogram(binwidth = 0.5)

# Boxplots - base R
boxplot(iris$Sepal.Length, ylab = "Sepal Length")

# Boxplots - ggplot2
ggplot(iris, aes(Sepal.Length)) + geom_boxplot()

#---------------------------------------------------------------------------------
# Producing comparative plots

# Comparative plots - baseR
boxplot(Sepal.Length ~ Species, data = iris,
        main = "Boxplot of Sepal Length by Species",
        xlab = "Species", ylab = "Sepal Length",
        col = c("red", "green", "blue"), border = "black")

# Comparative plots - ggplot2
iris_col <- c("red", "green", "blue")
ggplot(iris, aes(x = Species, y = Sepal.Length)) +  geom_boxplot(fill = iris_col)


#---------------------------------------------------------------------------------
# Producing plots of data through time (time series data)

# create some artificial data
ts_df <- data.frame(day = 1:365, value = cos(rnorm(365)) + sin(rnorm(365)))

# time series plot - baseR
plot(ts_df$day, ts_df$value, type = "l", xlab = "Time of Year", ylab = "Value",
     main = "Time Series Plot")

# time series plot - ggplot2
ggplot(ts_df, aes(x = day, y = value)) + geom_line()

#---------------------------------------------------------------------------------
# Displaying Bivariate Data

# Scatterplots - Base R
plot(iris$Sepal.Length, iris$Sepal.Width)


# Scatterplot - ggplot2
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) +  geom_point()
# adding in text labels
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point() +   geom_text(aes(label = Species),
                             hjust = 1.5, vjust = 1.5)
# Make this plot look a little nicer
iris$Species_Label <- iris$Species
class(iris$Species_Label)
levels(iris$Species_Label)
levels(iris$Species_Label) <- c("s", "v", "vi")
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point() +   geom_text(aes(label = Species_Label),
                             hjust = 1.5, vjust = 1.5)
# now add colour
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point() +   geom_text(aes(label = Species_Label),
                             hjust = 1.5, vjust = 1.5)


#----------------------------------------------------------------------------
# Advanced plotting techniques

# Base R - volcano data provided by Ross Ihaka
?volcano
filled.contour(volcano, color.palette = terrain.colors, asp = 1)
title(main = "volcano data: filled contour map")

# ggplot2 - volcano data
library(ggplot2)
library(reshape2)

# Convert the volcano matrix to a dataframe
volcano_df <- as.data.frame(melt(volcano))
colnames(volcano_df) <- c("x", "y", "value")

# Create the filled contour plot using ggplot2
ggplot(volcano_df, aes(x = x, y = y, fill = value)) +
  geom_raster(interpolate = TRUE) +
  scale_fill_gradientn(colours = terrain.colors(10)) +
  geom_contour(aes(z=value)) +
  coord_fixed() +
  labs(title = "volcano data: filled contour map",
       x = "X-axis",
       y = "Y-axis",
       fill = "Elevation") +
  theme_minimal()

# Faceting - splitting data into multiple panels

ggplot(iris,
       aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point() +
  facet_wrap(~ Species)




#----------------------------------------------------------------------------
# Customising plots

ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, col = Species)) +
  geom_point() +
  labs(title = "Sepal Dimensions by Species",
       x = "Sepal Length", y = "Sepal Width") +
  theme_minimal()
