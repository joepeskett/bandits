# learner

#' @title learner
#' @description Function for creating a learner that will interact with the multiarm bandit
#' @author Joe Peskett
#' @export
#' 
learner <- function(exploration_probability = 0.1){
  #returns a function that will interact with a multibandit object
  function(bandit){
    bandit_n <- length(bandit)
    exploration <- exploration_probability
  }
}



#' @title experiment
#' @description takes a multiarm bandit and a learner and runs through the training process. 
#' @author Joe Peskett
#' @export
experiment <- function(bandit, learner, runs, print_logs = F){
  return(logs)  
}
