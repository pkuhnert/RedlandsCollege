#-------------------------------------------------------------------------------
# This script explores R packages for data science
# Author: Petra Kuhnert
# Date: 30 May 2024
#-------------------------------------------------------------------------------

install.packages("tidyverse")
library(tidyverse)
library(lubridate)

# dplyr
?starwars
data <- starwars %>%
  select(name, height, mass, gender) %>%
  filter(!is.na(mass), mass > 100) %>%
  arrange(desc(mass))

# summarising data
summary <- data %>%
  group_by(gender) %>%
  summarise(
    average_height = mean(height, na.rm = TRUE),
    average_mass = mean(mass, na.rm = TRUE)
  )

# Manipulating dates
# Example data frame
data <- tibble(
  timestamp = c("2021-06-01 12:01:00", "2021-06-02 15:30:00", "2021-06-03 08:45:00"),
  value = c(10, 15, 20)
)

# Convert character to POSIXct date-time object and extract parts
data <- data %>%
  mutate(
    date_time = ymd_hms(timestamp),
    date = date(date_time),
    time = format(date_time, "%H:%M:%S"),
    month = month(date_time, label = TRUE),
    day = day(date_time)
  ) %>%
  select(-timestamp, -date_time)  # Clean up by removing the original timestamp columns

# Summarize data by month
monthly_summary <- data %>%
  group_by(month) %>%
  summarise(
    average_value = mean(value),
    total_value = sum(value),
    .groups = 'drop'  # Drop grouping structure after summarisation
  )

# Working with tibbles
# Creating a simple tibble
data <- tibble(
  x = 1:5,
  y = c("one", "two", "three", "four", "five"),
  z = c(TRUE, TRUE, FALSE, TRUE, FALSE)
)
data

# tidying data with tidyr
data %>%
  pivot_wider(names_from = y, values_from = z)

# Simplifying factors
data <- tibble(
  category = factor(c("apple", "banana", "apple", "banana", "cherry"))
)

# Reorder factors by frequency
data %>%
  mutate(category = fct_infreq(category))

# Working with strings
text <- "Hello, World!"
str_to_upper(text)

