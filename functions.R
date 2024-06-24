### Abstract screening ######################
# Project: Formal demography of fertility   #
# Purpose: Supporting functions	            #
# Author: Henrik-Alexander Schubert         #
# E-mail: schubert@demogr.mpg.de            #
# Date: 14.06.2024                          #
#############################################



# Harmonize the outcome across different settings
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

# Translate the outcomes to their meaning
translate_answers <- function(answer) {
  if (answer == yes){
    return("yes")
  } else if (answer == no) {
    return("no")
  } else {
    return("maybe") 
  }
}
