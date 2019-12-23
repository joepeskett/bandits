#' @title single_bandit
#' @description A creates a function that will
#' @author Joe Peskett
#' @export 
single_bandit <- function(){
  #random mean for single bandit
  bandit_mean <- runif(n = 1, min = -2, 2)
  bandit_sd <- runif(n = 1, min = 0, 2)
  return(
    function(print_centre = FALSE){
      if (print_centre == TRUE){
        return(list(mean = bandit_mean, sd = bandit_sd))
      }else{
        return(rnorm(n = 1, mean = bandit_mean, sd = bandit_sd))
      }
    }
  )
}

#' @title multibandit
#' @description Creates a function that will return a result from the
#' @author Joe Peskett
#' @export
multibandit <- function(n_bandit){
  if(n_bandit>0){
  #Create a list length n of single arm bandits
  bandits <- paste0("bandit",seq(1, n_bandit, 1))
  multi_bandit_list <- lapply(bandits, function(x) assign(x, single_bandit()))
  return(
    function(action, return_metrics = F){
      if(action>n_bandit){
        stop(paste("Total action =", n_bandit))
      }
      if(return_metrics == TRUE){
        return(list(metrics = multi_bandit_list[[action]](TRUE), n_bandit = n_bandit))
      }else{
        multi_bandit_list[[action]]()
      }
    }
  )
  }else{
    stop("number of bandits must be positive integer")
  }
}
