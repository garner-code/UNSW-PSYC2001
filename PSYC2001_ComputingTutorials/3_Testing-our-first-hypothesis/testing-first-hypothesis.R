###############################################################################
# Testing our first hypothesis!
# To complete the exercises in this script, follow Chapter X from
# insert book here
# K. Garner, 2025
###############################################################################

rm(list=ls()) # it is good practice to clear your environment at the start of 
# your script

###############################################################################
# Check if packages are installed, if not install.
if(!require(here)) install.packages('here') #checks if a package is installed and installs it if required.
if(!require(tidyverse)) install.packages('tidyverse')

## Activity - load packages using
# the library() function. 



###############################################################################
## Activity - Loading in the data

# Now Amend the code below to read in your fresh data
social_media <- read.csv(file = here(???,"PSYC2001_social-media-data-cleaned.csv"))

# now use the summary function to check your data, especially to make sure the pesky
# -999 values are gone!


###############################################################################
## Activity - Get back on the pipes

## run this code so you can see what it does
social_media %>% 
  select("id","good_mood_likes","bad_mood_likes") # choose which columns we want keep in our dataframe

## now run this code to pivot the data into longform format and see the results
social_media %>% 
  select("id","good_mood_likes","bad_mood_likes") %>% # choose columns we want keep in our dataframe
  pivot_longer(cols = ends_with("likes"), names_to = "mood", values_to = "likes")

## now, very important! amend the code above so that the new dataframe is saved to an object called
# social_media_likes. Then run the code to create the new dataframe.

# check the new dataframe using the head function. Remember to make your code match what's in the book!
(social_media_likes)


###############################################################################
## Activity - start plotting
## Plotting the data real pretty
social_media_likes %>% 
  ggplot(aes(x = likes, group = mood, fill = mood)) + # set canvas aesthetics
  geom_density() # use the data to draw a density plot 

# bonus activity - can you use the export button in the plots pane to save the figure to 
# the Output folder?

###############################################################################
## Activity - get descriptive!
## Get descriptive statistics

social_media_likes %>% 
  group_by(mood) %>% #split the data by mood
  summarise(mean = mean(likes),
            sd = sd(likes)) #calculate the mean number of likes and standard deviation


###############################################################################
## Activity - conducting a paired t-test
# Conducting a paired samples t-test

social_media$

t.test(x=social_media$, 
       y=social_media$,)


###############################################################################
# Bonus activity
social_media %>% 
  mutate(likes_diff = good_mood_likes - bad_mood_likes) #create a new column which is the difference
# between good mood likes and bad mood likes

# now amend the code above so that it starts with social_media_diff <- and run the code to create the new dataframe

# now run the paired t.test
t.test(x=social_media_diff$likes_diff)
