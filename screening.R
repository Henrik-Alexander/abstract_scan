### Abstract screening ######################
# Project: Formal demography of fertility   #
# Author: Henrik-Alexander Schubert         #
# E-mail: schubert@demogr.mpg.de            #
# Date: 14.06.2024                          #
#############################################


## Intro:
# This script supports you in selecting articles for the review.
# You will be presented with the title and abstract, which will
# be accompanied by a question for your answer. You can specify
# at the beginning your desired answering types: yes, maybe, no.
# There are two additional answers: "repeat" and "exit". Repeat will
# lead to showing you the previous title again, so that you can
# answer it for a second time. The "repeat" command will be important
# if you have done a mistake. Exit will
# lead to the exit of the program. This is relevant for ending your session.
# Continue running the remainder of 
# Please wait when you have typed exit until it prints "Screening complete!"


## Preparations ---------------------------------

# Run the two lines at the first time, which will install the packages.
# install.packages("data.table")
# install.packages("tidyverse")

# Load the packages into the environment
library(data.table)
library(tidyverse)

# Load the self-written functions
source("functions.R")

# Specify the name
author <- readline("Are you Annette? (Answer: yes or no) ")
if (author == "yes") {
  author <- "annette"
} else {
  author <- "henrik"
}


cat("Hello, ", author)


# Specify the terms
yes <- readline("What is your symbol for yes? (suggestion .) ")
no <- readline("What is your symbole for no? (suggestion is Enter) ")
maybe <- readline("What is your symbol for maybe? (suggestion is -) ")


## 1. Load data ---------------------------------

# Check if there is already a screened data
files <- list.files()
if(any(str_detect(string=files, pattern="screened_data"))){
  # Load the existing data
  df <- fread(files[str_detect(string=files, pattern="screened_data")], 
              encoding = "UTF-8")
  
  # Select all but the last
  analysed_data <- !is.na(df$result)
  df1 <- df[analysed_data]
  df <- df[!analysed_data]
  # 2. Assign the answers
  # 2. Assign the answers
  result <- rep(NA_character_, length = nrow(df))
  i <- 1
  while (i < nrow(df)) {
    cat("------------------------------- \n")
    cat("Title: \n", df$title[i], "\n")
    cat("\n")
    cat("Abstract: \n", df$abstract[i], "\n")
    answer <- readline(paste0("Is this contribution fitting the definition of formal demography of fertility? \n"))
    if (!(answer %in% c(yes, maybe, no, "exit"))) {
      message("You entered an incorrect answer! You have to give an answer again. \n")
    } else if (answer == "repeat") {
      i <- i - 1
    } else if (answer == "exit"){
      cat("Please run the remainder of the file in order to save the data. \n")
      cat("Then, rerun the entire file. It will only load the non-answered abstracts and the last one.")
      # Harmonize the result
      df$screening <- result
      df$result <- harmonize_outcomes(df)
      break 
      #return(df)
    } else {
      cat("Your answer for the last title was:", translate_answers(answer), "\n")
      result[i] <- answer
      i <- i + 1
      if (i %% 20 == 0) print("You can leave by writing exit!")
    }
  }
  # 3. Combine the existing data
  df <- rbindlist(list(df, df1))
  # Save the data
  write.csv(df, paste0("screened_data_", tolower(gsub(" ", "_", author)), ".csv"), fileEncoding = "UTF-8")
  
} else {
  # Load the data
  df <- fread("filtered_data.csv", encoding = "UTF-8")
  # 1. Assign the answers
  result <- rep(NA_character_, length = nrow(df))
  i <- 1
  while (i < nrow(df)) {
    cat("-------------------------------\n")
    cat("Title: \n", df$title[i], "\n")
    cat("\n")
    cat("Abstract: \n", df$abstract[i], "\n")
    answer <- readline(paste0("Is this contribution fitting the definition of formal demography of fertility? \n"))
    if (!(answer %in% c(yes, maybe, no, "exit"))) {
      cat("You entered an incorrect answer! You have to give an answer again. \n")
    } else if (answer == "repeat") {
      i <- i - 1
    } else if (answer == "exit"){
      cat("Please run the remainder of the file in order to save the data. \n")
      cat("Then, rerun the entire file. It will only load the non-answered abstracts and the last one.")
      # Harmonize the result
      df$screening <- result
      df$result <- harmonize_outcomes(df)
      break 
      #return(df)
    } else {
      cat("Your answer for the last title was:", translate_answers(answer), "\n")
      result[i] <- answer
      i <- i + 1
      if(i %% 20 == 0) print("You can leave by writing exit!")
    }
  }
  
  # Save the data
  write.csv(df, paste0("screened_data_", tolower(gsub(" ", "_", author)), ".csv"), fileEncoding = "UTF-8")
}

cat(paste("Screening complete! Thank you,", author))

### END #########################
