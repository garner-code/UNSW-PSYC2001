###############################################################################
# Testing our first hypothesis!
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

library() #loads in the specified package
library()


###############################################################################
## Loading and checking data

# Now Amend the code below to read in your fresh data
social_media <- read.csv(file = here("Data","PSYC2001_social-media-data-cleaned.csv"))

# now use the summary function to check your data, especially to make sure the pesky
# -999 values are gone!


###############################################################################
## Get the data into longform format

social_media_likes <- social_media %>% 
  select("id","good_mood_likes","bad_mood_likes") %>% # choose which columns we want keep in our dataframe
  pivot_longer(cols = ends_with("likes"), names_to = "mood", values_to = "likes")

# check the new dataframe using the head function. Remember to make your code match what's in the book!
(social_media_likes)

