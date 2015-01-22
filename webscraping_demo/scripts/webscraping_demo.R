# This is a toy project to illustrate webscraping with R
# The basic tasks we want to implement are

# 1) Collect data from a webpage
# 2) Clean the collected data, put it in a tabular format
# 3) Save the information as .csv
# 4) Automate the process so:
# 4.a) Data is collected every day from the same webpage
# 4.b) Additional data is appended to the existing .csv file

## Load libraries
options(stringsAsFactors = FALSE)
library(rvest)

## STEP 1: Get raw data from twitter webpage
# url of webpage you want to retrieve data from
url <- 'https://twitter.com/search?f=realtime&q=%23rstats&src=tyah'
# Download and parse html
page <- html(url)

## STEP 2: Extract the information we need
# Extract tweets
tweets <- html_nodes(page, ".tweet-text")
tweets <- html_text(tweets)
#tweets
# Extract service status information
users <-  html_nodes(page, ".js-action-profile-name b")
users <- html_text(users)
#users
# Extract number of time tweet was favorited
favorited <- html_nodes(page, ".js-actionFavorite .ProfileTweet-actionCountForPresentation")
favorited <- html_text(favorited)
favorited
## STEP 3: Turn to tabular format
output <- cbind(users, tweets, favorited)
output <- as.data.frame(output)
# Add time stamp
output$time_stamp <- Sys.time()

## STEP 4: Save on my computer
write.table(output,  
            file = 'C:/Users/Tony/Documents/divers/mini_projects/r_code/webscraping_demo/data/twitter.csv', 
            sep = ',', 
            row.names = FALSE,
            append = TRUE)
