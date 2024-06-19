

# Translate to outcome
harmonize_outcomes <- function(data){
  columns <- str_detect(names(data), "screening")
  if(!any(columns)){
    warning("There is no result column!")
  } else {
    tmp <- data[["screening"]]
    tmp[tmp == yes] <- "yes"
    tmp[tmp == maybe] <- "maybe"
    tmp[tmp == no] <- "no"
    return(tmp)
  }
}

# Translate the ooutcomes
translate_answers <- function(answer) {
  if (answer == yes){
    return("yes")
  } else if (answer == no) {
    return("no")
  } else {
    return("maybe") 
  }
}


# Create the result vector
assign_answers <- function(df) {
  result <- rep(NA_character_, length = length(df))
  i <- 1
  while (i < nrow(df)) {
    cat("-------------------------------\n ")
    cat("Title: \n", df$title[i], "\n")
    cat("\n")
    cat("Abstract: \n", df$abstract[i], "\n")
    answer <- readline(paste0("Is this contribution fitting the definition of formal demography of fertility? \n"))
    if (!(answer %in% c(yes, maybe, no, "exit"))) {
      cat("You entered an incorrect answer! You have to give an answer again. \n")
    } else if (answer == "repeat") {
      i <- i - 1
    }else if (answer == "exit"){
      cat("Please run the remainder of the file in order to save the data. \n")
      cat("Then, rerun the entire file. It will only load the non-answered abstracts and the last one.")
      # Harmonize the result
      df$result <- harmonize_outcomes(df)
      break 
      return(df)
    }  else {
      cat("Your answer for the last title was:", translate_answers(answer), "\n")
      result[i] <- answer
      i <- i + 1
      if(i %% 20 == 0) print("You can leave by pressing Esc!")
    }
  }
  
  # Harmonize the result
  df$result <- harmonize_outcomes(df)
  
  return(df)
}

