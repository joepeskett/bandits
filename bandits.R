# Example functions:

#' @title single_bandit
#' @description A creates a function that will
single_bandit <- function(){
  #random mean for single bandit
  bandit_mean <- runif(n = 1, min = -2, 2)
  bandit_sd <- runif(n = 1, min = -2, 2)
  return(
    function(print_centre = FALSE){
      if (print_centre == TRUE){
        return(list(mean = bandit_mean, sd = bandit_sd))
      }else{
        return(rnorm(n = 1, mean = bandit_mean, sd = bandit_sd))
      }
    }
  )
  #Function
}


# In here I want a function to create a list of bandits so that the single bandit is used 5 distinct times

#' @title multibandit
#' @description Creates a function that will return a result from the
#' 
multibandit <- function(n_bandit){
  #Create a list length n of single arm bandits
  
  return(
    function(){
      
    }
  )
}