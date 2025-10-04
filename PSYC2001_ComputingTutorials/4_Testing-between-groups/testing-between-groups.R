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

library(here) #loads in the specified package
library(tidyverse)

###############################################################################
## Step 2: Load in the data using the read_csv() function combined with here()


# check the data has loaded in correctly by using the head() function to view as many rows as you 
# would like
head(social_media, ??)


###############################################################################
## Data wrangling
# create the likes variable
social_media %>% 
  mutate(likes =(bad_mood_likes + good_mood_likes)/2 )

# amend the code above to select only id, urban, like, and followers, and save 
# to a dataframe object called social_media_likes


# check you kept the variables you want
str()

# now run the below code to turn urban from an integer to a factor
social_media_likes <- social_media_likes %>% 
  mutate(urban = factor(urban, levels=c('urban', 'rural'))) #changes the urban variable to a factor with levels urban and rural

#############################################################################
## Data viz
# amend this code so that it creates a histogram of the followers variable
social_media_NA %>%
  ggplot(aes(x = time_on_social)) + #ggplot uses aesthetic (aes()) to map axes. 
  geom_histogram(binwidth=10, col="black", fill="seagreen") + #creates a histogram
  labs(x = "Time on social media", y = "Density") + #short for "labels", use to label axes and titles.
  theme_classic() #changes the theme of the plot to a classic theme. makes it prettier!

# copy and paste the amended code here, and change it so that you get a histogram of followers instead.



###############################################################################
## Descriptive statistics
social_media_descriptives <- social_media_likes %>% # save to new object called social_media_descriptives
  group_by() %>% # group the data by urban
  summarise(
    mean_followers = mean(followers), # calculate the mean number of followers for urban and rural groups separately
    mean_likes = mean(likes),
    sd_followers = sd(), 
    sd_likes = sd()
  )

social_media_descriptives # view the new dataframe object

###############################################################################
## Perform the statistical analysis

t.test(likes~urban, data=social_media_likes) # conducts an independent samples t-test to see if likes differ by urban/rural status
# bonus - save the output of the t.test for later reference
likes_t <- t.test(likes~urban, data=social_media_likes) 
likes_t # view the output

# now complete the code below for the followers variable
t.test(???, data=social_media_likes) # conducts an independent samples t-test to see if followers differ by urban/rural status
# save it for later, if you like!

###############################################################################
## Bonus activity - Visualise group differences

# here is the code for a grouped boxplot of likes by urban/rural status
social_media_likes %>% 
  ggplot(aes(y = likes, fill = urban, x = urban)) + # here we are telling ggplot that we will be putting likes
  # on the y axis, that we will fill in our boxplots with colour using the urban factor, and that urban will go on the x-axis
  geom_boxplot() + # this function creates a boxplot
  labs(x = "Living Area", y = "Average Rate of Likes") + # here we use labs() to label our axes.
  scale_fill_manual(values = c(rural = "plum", urban = "cyan2")) + #manually define the filled in colours of specific parts of a graph - see here for more R colours: https://r-graph-gallery.com/42-colors-names.html
  theme_classic() 

# copy and paste it here, and amend it to create a boxplot of followers by urban/rural status

# now copy and paste the code to save the plot, and amend it for the followers boxplot

