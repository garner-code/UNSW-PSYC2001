###############################################################################
# Data wrangling and visualisation lab.
# This script will get you started on handling data and creating visualizations
# in R and RStudio.
# To complete the exercises in this script, follow Chapter X from
# insert book here
# K. Garner, 2025
###############################################################################

rm(list=ls()) # it is good practice to clear your environment at the start of 
# your script

###############################################################################
## Step 1: Copy and paste the code to install packages and load packages using
# the library() function. Make sure you run the code by highlighting and running
# it.

# Check if packages are installed, if not install.
if(!require(here)) install.packages('here') #checks if a package is installed and installs it if required.
if(!require(tidyverse)) install.packages('tidyverse')
if(!require(ggplot2)) install.packages('ggplot2')

library(here) #loads in the specified package
library(tidyverse)
library(ggplot2)

###############################################################################
## Step 2: Find out more about the 'here' package.
?here

## Now finish and run the code that will import the social media data for 
# you and store it to an object called social_media
social_media <- 

## Now look at the data programmatically. Complete the following methods
# to view the data. Also update the comments with missing information.

# Method 2 - Use the View function
View() #view automatically displays the dataset in a tab.

# Method 3 - Use the head function
head() #head displays the first ...

# Method 4 -
str()

###############################################################################
## Summarise you data using the summary() function. What do you notice about the
# data?


## Complete the below code to find out how many cases of -999 there are in the 
# time_on_social variable
social_media_filtered <- filter(social_media, time_on_social == ) #keep all rows where `time_on_social` is equal to -999
View() #view the filtered dataframe
count(social_media_filtered) #count the number of rows in the filtered dataframe

## Now do the same as above but using the pipe operator %>%


###############################################################################
## Time to replace those -999s with NAs, using mutate() and na_if().


## Now run the summary() function again


###############################################################################
## Save the data as a csv file using the write_csv() and here() functions.
write.csv(social_media_NA, here("Output","PSYC2001_social-media-data-cleaned.csv"))

###############################################################################
## Data visualisation
# testing what we mean by making a canvas with ggplot
social_media_NA %>%
  ggplot(aes(y = ))

# Now add a boxplot to the canvas
social_media_NA %>%
  ggplot(aes(y = )) + #ggplot uses aesthetic (aes()) to map axes. 
    geom_boxplot() 
  
# Complete the code below to draw a histogram of the time_on_social variable
social_media_NA %>%
  ggplot(aes(x = )) + #ggplot uses aesthetic (aes()) to map axes. 
  geom_histogram() + #creates a histogram
  labs(x = "Time on social media (hours)", y = "Density") + #short for "labels", use to label axes and titles.
  theme_classic() #changes the theme of the plot to a classic theme. makes it prettier!
# You can also use theme_minimal(), theme_light(), theme_dark() etc.